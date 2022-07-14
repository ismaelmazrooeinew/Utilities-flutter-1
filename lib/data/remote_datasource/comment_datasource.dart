import 'package:utilities/utilities.dart';

class CommentDataSource {
  final String baseUrl;

  CommentDataSource({required this.baseUrl});

  Future<void> create({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final String id,
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Comment?id=$id",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
  Future<void> readByProductId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment/ReadByProductId/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(String) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Comment?id=$id",
        action: (Response response) => onResponse(response.statusCode.toString()),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
