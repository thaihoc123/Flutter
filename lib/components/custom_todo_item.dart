import 'package:flutter/material.dart';

import '/models/todo_list.dart';
import '/resourses/app_color.dart';

class ToDoItem extends StatelessWidget {
  final ToDoDetail todo;
  final VoidCallback? onChanged;
  final VoidCallback? onDelete;

  const ToDoItem({
    super.key,
    required this.todo,
    this.onChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey),
          borderRadius: BorderRadius.circular(20),
          color: AppColor.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 6,
              color: AppColor.grey,
            ),
          ]),
      child: ListTile(
        onLongPress: onDelete,
        onTap: onChanged,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: AppColor.blue,
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 15,
            color: AppColor.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: CircleAvatar(
          backgroundColor: AppColor.red,
          child: IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
