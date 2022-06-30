import 'package:utilities/utilities.dart';

class UserDataSource {
  final String baseUrl;

  UserDataSource({required this.baseUrl});

  Future<void> create({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/user",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> update({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/user",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/user",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/user/$id",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/user/$id",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> activeMobile({
    required final ActiveMobileDto dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/user/ActiveMobile",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> getMobileVerificationCodeForLogin({
    required final GetMobileVerificationCodeForLoginDto dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/user/GetMobileVerificationCodeForLogin",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> loginWithEmail({
    required final LoginWithEmail dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/user/LoginWithEmail",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> verifyMobileForLogin({
    required final VerifyMobileForLoginDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/user/VerifyMobileForLogin",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> getProfile({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/user/GetProfile",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> getGrowthRate({
    required final Function(GenericResponse<GrowthRateReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/user/GrowthRate",
        action: (Response response) => onResponse(GenericResponse<GrowthRateReadDto>.fromJson(response.body, GrowthRateReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> getProfileByUserName({
    required final String userName,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/user/GetProfileByUsername/$userName",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> updateProfile({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/user/UpdateProfile",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );
}
