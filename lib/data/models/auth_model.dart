import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  final String id;
  final String message;

  SignupResponse({
    required this.id,
    required this.message,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        id: json["id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
      };
}

SigninResponse signinResponseFromJson(String str) =>
    SigninResponse.fromJson(json.decode(str));

String signinResponseToJson(SigninResponse data) => json.encode(data.toJson());

class SigninResponse {
  final String message;
  final String token;

  SigninResponse({
    required this.message,
    required this.token,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) => SigninResponse(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}

VerifyResponse verifyResponseFromJson(String str) =>
    VerifyResponse.fromJson(json.decode(str));

String verifyResponseToJson(VerifyResponse data) => json.encode(data.toJson());

class VerifyResponse {
  final String id;
  final String message;

  VerifyResponse({
    required this.id,
    required this.message,
  });

  factory VerifyResponse.fromJson(Map<String, dynamic> json) => VerifyResponse(
        id: json["id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
      };
}
