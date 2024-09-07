import 'package:connectme/data/datasources/local/shared_preferences.dart';
import 'package:connectme/data/datasources/remote/network/api_config.dart';
import 'package:connectme/data/datasources/remote/network/dio_client.dart';
import 'package:connectme/data/datasources/remote/network/logger.dart';
import 'package:connectme/data/models/auth_model.dart';
import 'package:connectme/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiConfig _apiConfig = ApiConfig();
  final Dio _dio = DioClient().dio;

  @override
  Future<SignupResponse> signUp(
      String name, String email, String password, String phoneNumber) async {
    try {
      final response = await _dio.post(
        _apiConfig.signUp,
        data: {
          "fullName": name,
          "email": email,
          "password": password,
          "phone": phoneNumber,
        },
      );
      AuthPreference.saveId(response.data["id"]);

      return SignupResponse.fromJson(response.data);
    } catch (e) {
      AppLogger.error('Error di signup', e);
      rethrow;
    }
  }

  @override
  Future<SigninResponse> signIn(String email, String password) async {
    try {
      final response = await _dio.post(_apiConfig.signIn, data: {
        "email": email,
        "password": password,
      });
      AuthPreference.saveToken(response.data["token"]);

      return SigninResponse.fromJson(response.data);
    } catch (e) {
      AppLogger.error('Error di signin', e);
      rethrow;
    }
  }

  @override
  Future<VerifyResponse> verify(String code) async {
    try {
      final id = await AuthPreference.getId();
      final response = await _dio.post(_apiConfig.verify, data: {
        "id": id,
        "code": code,
      });
      print("ini id " + id! + "dan ini codenya " + code);

      print("\n\n");

      print(response.data);

      return VerifyResponse.fromJson(response.data);
    } catch (e) {
      AppLogger.error('Error di verify', e);
      rethrow;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await AuthPreference.deleteToken();
      return true;
    } catch (e) {
      AppLogger.error('Error in signOut', e);
      return false;
    }
  }
}
