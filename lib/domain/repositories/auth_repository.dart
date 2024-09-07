import 'package:connectme/data/models/auth_model.dart';

abstract class AuthRepository {
  Future<SignupResponse> signUp(
    String name,
    String email,
    String password,
    String phoneNumber,
  );
  Future<SigninResponse> signIn(
    String email,
    String password,
  );
  Future<VerifyResponse> verify(
    String code,
  );
  Future<bool> signOut();
}
