import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class UserDataSource2 {
  final String baseUrl;

  UserDataSource2({required this.baseUrl});

  Future<void> create({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> checkUsername({
    required final String userName,
    required final VoidCallback onResponse,
    required final Function(String statusCode) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user/CheckUserName/$userName",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(response.statusCode.toString()),
      );
  Future<void> checkUsername2({
    required final String userName,
    required final VoidCallback onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user/CheckUserName/$userName",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> update({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut3(
        url: "$baseUrl/user",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> read({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/user",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(String statusCode) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/user/$id",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(response.statusCode.toString()),
      );
  Future<void> readById2({
    required final String id,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/user/$id",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete3(
        url: "$baseUrl/user/$id",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> deleteFromTeam({
    required final String teamId,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
  }) async =>
      httpDelete3(
        url: "$baseUrl/user/DeleteFromTeam/$teamId",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(),
      );

  Future<void> activeMobile({
    required final ActiveMobileDto dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user/ActiveMobile",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> getVerificationCodeForLogin({
    required final GetMobileVerificationCodeForLoginDto dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user/GetVerificationCodeForLogin",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> loginWithEmail({
    required final LoginWithEmail dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user/LoginWithEmail",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> verifyCodeForLogin({
    required final VerifyMobileForLoginDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user/VerifyCodeForLogin",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> getProfile({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/user/GetProfile",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> getGrowthRate({
    required final Function(GenericResponse<GrowthRateReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/user/GrowthRate",
        action: (Response response) => onResponse(GenericResponse<GrowthRateReadDto>.fromJson(response.data, fromMap: GrowthRateReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> getProfileByUserName({
    required final String userName,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/user/GetProfileByUsername/$userName",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> updateProfile({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut3(
        url: "$baseUrl/user/UpdateProfile",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> filter({
    required final UserFilterDto dto,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/user/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
