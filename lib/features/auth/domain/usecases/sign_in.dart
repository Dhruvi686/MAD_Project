import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// SignIn use case for user authentication
class SignIn implements UseCase<User, SignInParams> {
  final AuthRepository repository;

  SignIn(this.repository);

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    return await repository.signIn(params.email, params.password);
  }
}

/// Parameters for SignIn use case
class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
