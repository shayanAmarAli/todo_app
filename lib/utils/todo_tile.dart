import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    this.onChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: Colors.black12,
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration:
                      isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
