import 'package:dartz/dartz.dart';

import '../error/failures.dart';

/// Abstract UseCase class following Clean Architecture principles
/// All use cases should implement this interface
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// NoParams class for use cases that don't require parameters
class NoParams {}
