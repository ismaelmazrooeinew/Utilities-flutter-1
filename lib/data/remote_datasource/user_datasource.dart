import 'package:utilities/utilities.dart';

class UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSource({required this.baseUrl});

  Future<void> requestVerificationCodeForLogin<T>({
    required final String url,
    required final String mobile,
    required final Function(GenericResponse<T>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/RequestVerificationCodeForLogin",
        body: RequestVerificationCodeForLoginParams(mobile: mobile),
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> verifyMobileNumberForLogin<T>({
    required final String url,
    required final String mobile,
    required final String verificationCode,
    required final Function(GenericResponse<T>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/RequestVerificationCodeForLogin",
        body: VerifyMobileNumberForLoginParams(mobile: mobile, verificationCode: verificationCode),
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> updateProfile<T>({
    required final String url,
    required final UpdateProfileParams params,
    required final Function(GenericResponse<T>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/RequestVerificationCodeForLogin",
        body: params,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
