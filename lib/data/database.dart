import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  final _myBox = Hive.box('my_box');

  // run this method if this is the 1st time ever opening the app
  void createInitialData() {
    todoList = [
      ['Make todo app', false],
      ['Learn hive', false],
    ];
  }

  // load the data from the database
  void loadTodo() {
    todoList = _myBox.get('TODOLIST'); // TODOLIST is used as a key to get the data from the database
    if (todoList.isEmpty) {
      createInitialData(); // if the data is empty, create initial data
    }
  }

  // update the database
  void updateTodoList() {
    _myBox.put('TODOLIST', todoList);
  }
}
