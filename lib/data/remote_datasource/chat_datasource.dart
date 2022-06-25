import 'package:utilities/utilities.dart';

class ChatDataSource {
  final String baseUrl;

  ChatDataSource({required this.baseUrl});

  Future<void> create({
    required final ChatCreateDto dto,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.body, ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ChatReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat",
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.body, ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ChatReadDto.fromMap)),
      );

  Future<void> readByUserId({
    required final String userId,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/$userId",
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.body, ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ChatReadDto.fromMap)),
      );
}
