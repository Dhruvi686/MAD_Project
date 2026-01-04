import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/entities/todo.dart';
import '../repositories/todo_repository.dart';

/// UpdateTodo use case for modifying an existing todo
class UpdateTodo implements UseCase<void, UpdateTodoParams> {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateTodoParams params) async {
    return await repository.updateTodo(params.todo);
  }
}

/// Parameters for UpdateTodo use case
class UpdateTodoParams {
  final Todo todo;

  UpdateTodoParams(this.todo);
}