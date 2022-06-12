import 'package:utilities/data/dto/comment.dart';
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
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> update({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<List<CommentReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );


  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
