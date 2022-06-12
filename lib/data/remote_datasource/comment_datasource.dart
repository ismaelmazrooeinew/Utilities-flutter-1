import 'package:utilities/data/dto/comment.dart';
import 'package:utilities/utilities.dart';

class CommentDataSource {
  final String baseUrl;

  CommentDataSource({required this.baseUrl});

  Future<void> createComment({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> updateComment({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readComment({
    required final Function(GenericResponse<List<CommentReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/Comment",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );


  Future<void> deleteComment({
    required final String id,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      delete(
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
