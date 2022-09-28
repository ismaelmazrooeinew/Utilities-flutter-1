import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/data/dto/vote.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class VoteDataSource2 {
  final String baseUrl;

  VoteDataSource2({required this.baseUrl});

  Future<void> createVote({
    required final VoteCreateUpdateDto dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Vote",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: Vote.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> createVoteField({
    required final VoteFieldCreateUpdateDto dto,
    required final Function(GenericResponse<VoteField>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Vote/VoteField",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<VoteField>.fromJson(response.data, fromMap: VoteField.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> read({
    required final String id,
    required final Function(GenericResponse<VoteField>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/VoteField/$id",
        action: (Response response) => onResponse(GenericResponse<VoteField>.fromJson(response.data, fromMap: VoteField.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
