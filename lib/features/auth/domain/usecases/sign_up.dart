import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// SignUp use case for user registration
class SignUp implements UseCase<User, SignUpParams> {
  final AuthRepository repository;

  SignUp(this.repository);

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await repository.signUp(params.email, params.password);
  }
}

/// Parameters for SignUp use case
class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}
