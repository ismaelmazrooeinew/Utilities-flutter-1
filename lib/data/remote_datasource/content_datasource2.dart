import 'package:dio/dio.dart';
import 'package:utilities/data/dto/content.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class ContentDataSource2 {
  final String baseUrl;

  ContentDataSource2({required this.baseUrl});

  Future<void> create({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.data, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> update({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut3(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.data, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> read({
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Content",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.data, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Content/$id",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.data, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete3(
        url: "$baseUrl/Content/$id",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.data, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
