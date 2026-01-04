import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import 'todo_item.dart';

/// TodoList displays a list of todos using BlocBuilder
class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoLoaded) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(todo: state.todos[index]);
            },
          );
        } else if (state is TodoError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No todos'));
        }
      },
    );
  }
}