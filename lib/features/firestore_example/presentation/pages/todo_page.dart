import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import '../widgets/todo_list.dart';
import '../../../../core/entities/todo.dart';

/// TodoPage provides the main UI for todo management
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(LoadTodosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement sign out
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final todo = Todo(
                      id: '', // Will be set by Firestore
                      title: _titleController.text,
                      description: _descriptionController.text,
                      createdAt: DateTime.now(),
                    );
                    context.read<TodoBloc>().add(AddTodoEvent(todo));
                    _titleController.clear();
                    _descriptionController.clear();
                  },
                  child: const Text('Add Todo'),
                ),
              ],
            ),
          ),
          Expanded(
            child: TodoList(),
          ),
        ],
      ),
    );
  }
}
