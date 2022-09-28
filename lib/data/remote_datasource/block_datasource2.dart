import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class BlockDataSource2 {
  final String baseUrl;

  BlockDataSource2({required this.baseUrl});

  Future<void> create({
    required final String userId,
    required final Function(GenericResponse<dynamic>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Block?userId=$userId",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.data)),
        error: (Response response) => onError(GenericResponse()),
      );

  Future<void> read({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Block",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readMine({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Block/ReadMine",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
