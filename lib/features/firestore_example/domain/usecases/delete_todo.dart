import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/todo_repository.dart';

/// DeleteTodo use case for removing a todo
class DeleteTodo implements UseCase<void, DeleteTodoParams> {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteTodoParams params) async {
    return await repository.deleteTodo(params.id);
  }
}

/// Parameters for DeleteTodo use case
class DeleteTodoParams {
  final String id;

  DeleteTodoParams(this.id);
}