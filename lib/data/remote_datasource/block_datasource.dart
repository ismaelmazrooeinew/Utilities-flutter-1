import 'package:utilities/utilities.dart';

class BlockDataSource {
  final String baseUrl;

  BlockDataSource({required this.baseUrl});

  Future<void> create({
    required final String userId,
    required final Function(GenericResponse<dynamic>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Block?userId=$userId",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse()),
      );

  Future<void> read({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Block",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readMine({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Block/ReadMine",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
