import 'package:utilities/utilities.dart';

class UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSource({required this.baseUrl});

  Future<void> getMobileVerificationCodeForLogin({
    required final String url,
    required final String mobile,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/GetMobileVerificationCodeForLogin",
        body: GetMobileVerificationCodeForLoginDto(mobile: mobile, sendSms: true),
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> verifyMobileNumberForLogin({
    required final String url,
    required final String mobile,
    required final String verificationCode,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/VerifyMobileForLogin",
        body: VerifyMobileForLoginDto(mobile: mobile, verificationCode: verificationCode),
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> getProfile({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/user/GetProfile",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> updateProfile({
    required final String url,
    required final UpdateProfileParams params,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/UpdateProfile",
        body: params,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
