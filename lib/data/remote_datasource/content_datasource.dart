import 'package:utilities/utilities.dart';

class ContentDataSource {
  final String baseUrl;

  ContentDataSource({required this.baseUrl});

  Future<void> create({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ContentReadDto.fromMap)),
      );

  Future<void> update({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ContentReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Content",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ContentReadDto.fromMap)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Content/$id",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ContentReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Content/$id",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ContentReadDto.fromMap)),
      );
}
