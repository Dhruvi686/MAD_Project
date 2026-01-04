/// Abstract Failure class for error handling
/// All failures should extend this class
abstract class Failure {
  final String message;
  const Failure(this.message);
}

/// Failure for authentication errors
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Failure for server/database errors
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Failure for network connectivity issues
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
