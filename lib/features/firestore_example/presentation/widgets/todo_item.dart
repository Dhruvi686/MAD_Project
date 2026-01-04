import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import '../../../../core/entities/todo.dart';

/// TodoItem represents a single todo item in the list
class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: todo.isCompleted,
            onChanged: (value) {
              final updatedTodo = todo.copyWith(isCompleted: value);
              context.read<TodoBloc>().add(UpdateTodoEvent(updatedTodo));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<TodoBloc>().add(DeleteTodoEvent(todo.id));
            },
          ),
        ],
      ),
    );
  }
}
