import 'package:utilities/utilities.dart';

class UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSource({required this.baseUrl});

  Future<void> createUser({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
  Future<void> deleteUser({
    required final String id,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      delete(
        url: "$baseUrl/user/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> getMobileVerificationCodeForLogin({
    required final GetMobileVerificationCodeForLoginDto dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/GetMobileVerificationCodeForLogin",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> loginWithEmail({
    required final LoginWithEmail dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/LoginWithEmail",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> verifyMobileForLogin({
    required final VerifyMobileForLoginDto dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/user/VerifyMobileForLogin",
        body:dto,
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

  Future<void> getProfileByUserName({
    required final String userName,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/user/GetProfileByUsername/$userName",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> updateProfile({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      put(
        url: "$baseUrl/user/UpdateProfile",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
