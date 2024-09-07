part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthRegistered extends AuthState {}

class AuthVerified extends AuthState {}

class AuthSignedIn extends AuthState {
  final SigninResponse user;

  const AuthSignedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthSignedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}
