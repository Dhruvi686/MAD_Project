import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/update_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../../../core/entities/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

/// TodoBloc manages todo state and handles todo events
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final DeleteTodo deleteTodo;

  TodoBloc({
    required this.getTodos,
    required this.addTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  Future<void> _onLoadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await getTodos(NoParams());
    result.fold(
      (failure) => emit(TodoError(failure.message)),
      (todos) => emit(TodoLoaded(todos)),
    );
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    final result = await addTodo(AddTodoParams(event.todo));
    result.fold(
      (failure) => emit(TodoError(failure.message)),
      (_) => add(LoadTodosEvent()),
    );
  }

  Future<void> _onUpdateTodo(
      UpdateTodoEvent event, Emitter<TodoState> emit) async {
    final result = await updateTodo(UpdateTodoParams(event.todo));
    result.fold(
      (failure) => emit(TodoError(failure.message)),
      (_) => add(LoadTodosEvent()),
    );
  }

  Future<void> _onDeleteTodo(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    final result = await deleteTodo(DeleteTodoParams(event.id));
    result.fold(
      (failure) => emit(TodoError(failure.message)),
      (_) => add(LoadTodosEvent()),
    );
  }
}
