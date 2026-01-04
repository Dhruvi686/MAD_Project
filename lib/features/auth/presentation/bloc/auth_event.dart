part of 'auth_bloc.dart';

/// Base class for all authentication events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Event for user sign in
class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

/// Event for user sign up
class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const SignUpEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

/// Event for user sign out
class SignOutEvent extends AuthEvent {}
