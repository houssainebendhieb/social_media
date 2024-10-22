part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final AppUser user;
  Authenticated(this.user);
}

final class Unauthenticated extends AuthState {
  final String failedMessage;
  Unauthenticated({required this.failedMessage});
}

final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
