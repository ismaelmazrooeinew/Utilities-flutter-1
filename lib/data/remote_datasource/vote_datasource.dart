import 'package:utilities/utilities.dart';

class VoteDataSource  {
  final String baseUrl;

  VoteDataSource ({required this.baseUrl});

  Future<void> createVote({
    required final VoteCreateUpdateDto dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Vote",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, Vote.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, Vote.fromMap)),
      );

  Future<void> createVoteField({
    required final VoteFieldCreateUpdateDto dto,
    required final Function(GenericResponse<VoteField>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Vote/VoteField",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<VoteField>.fromJson(response.body, VoteField.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, VoteField.fromMap)),
      );

  Future<void> read({
    required final String id,
    required final Function(GenericResponse<VoteField>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/VoteField/$id",
        action: (Response response) => onResponse(GenericResponse<VoteField>.fromJson(response.body, VoteField.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, VoteField.fromMap)),
      );
}
