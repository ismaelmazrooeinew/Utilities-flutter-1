import 'package:utilities/data/dto/chat.dart';
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
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );


  Future<void> read({
    required final Function(GenericResponse<List<ChatReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readByUserId({
    required final String userId,
    required final Function(GenericResponse<List<ChatReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/$userId",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

}
