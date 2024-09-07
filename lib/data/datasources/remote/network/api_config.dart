import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  String get _baseUrl => dotenv.env['BASE_URL']!;

  // auth endpoint
  String get signUp => "$_baseUrl/auth/signup";
  String get signIn => "$_baseUrl/auth/signin";
  String get verify => "$_baseUrl/verify";
}
