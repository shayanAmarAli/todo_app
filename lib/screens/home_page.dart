import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import '../../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Reference the hive box
  final _myBox = Hive.box('my_box');
  final _controller = TextEditingController();

  // List of todo task
  // List todoList = [
  //   ['Task 1', false],
  //   ['Task 2', true],
  //   ['Task 3', false],
  //   ['Task 4', true],
  // ];
  TodoDatabase db =
      TodoDatabase(); // Make the instance of the database to get the data from it

  @override
  void initState() {
    super.initState();
    // if the app is opened for the first time, create initial data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadTodo(); // load the data from the database
    }
  }

  void checkboxChecked(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateTodoList(); // update the database after checking the checkbox
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxWidget(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      print("The value is: ${_controller.text}");
      // if (_controller.text.isNotEmpty) {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
      // }
    });
    Navigator.of(context).pop();
    db.updateTodoList(); // update the database after deleting the task
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateTodoList(); // update the database after deleting the task
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(title: Text('Home page'), elevation: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            isCompleted: db.todoList[index][1],
            onChanged: (value) => checkboxChecked(value, index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
