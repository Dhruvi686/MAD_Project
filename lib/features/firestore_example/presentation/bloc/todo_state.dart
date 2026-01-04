part of 'todo_bloc.dart';

/// Base class for all todo states
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

/// Initial state when the bloc is first created
class TodoInitial extends TodoState {}

/// State when todo operation is in progress
class TodoLoading extends TodoState {}

/// State when todos are successfully loaded
class TodoLoaded extends TodoState {
  final List<Todo> todos;

  const TodoLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

/// State when todo operation fails
class TodoError extends TodoState {
  final String message;

  const TodoError(this.message);

  @override
  List<Object> get props => [message];
}
