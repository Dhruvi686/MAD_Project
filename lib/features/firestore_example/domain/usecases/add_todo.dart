import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/entities/todo.dart';
import '../repositories/todo_repository.dart';

/// AddTodo use case for creating a new todo
class AddTodo implements UseCase<void, AddTodoParams> {
  final TodoRepository repository;

  AddTodo(this.repository);

  @override
  Future<Either<Failure, void>> call(AddTodoParams params) async {
    return await repository.addTodo(params.todo);
  }
}

/// Parameters for AddTodo use case
class AddTodoParams {
  final Todo todo;

  AddTodoParams(this.todo);
}