part of 'todo_bloc.dart';

/// Base class for all todo events
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

/// Event to load all todos
class LoadTodosEvent extends TodoEvent {}

/// Event to add a new todo
class AddTodoEvent extends TodoEvent {
  final Todo todo;

  const AddTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

/// Event to update an existing todo
class UpdateTodoEvent extends TodoEvent {
  final Todo todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

/// Event to delete a todo
class DeleteTodoEvent extends TodoEvent {
  final String id;

  const DeleteTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}
