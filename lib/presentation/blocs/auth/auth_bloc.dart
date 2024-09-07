import 'package:bloc/bloc.dart';
import 'package:connectme/data/models/auth_model.dart';
import 'package:connectme/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signUp(
          event.name,
          event.email,
          event.password,
          event.phoneNumber,
        );
        emit(AuthRegistered());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SigninEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.signIn(event.email, event.password);
        emit(AuthSignedIn(user: user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<VerifyUser>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.verify(event.code);
        emit(AuthVerified());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final success = await authRepository.signOut();
        if (success) {
          emit(AuthSignedOut());
        } else {
          emit(const AuthError('Failed to sign out'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
