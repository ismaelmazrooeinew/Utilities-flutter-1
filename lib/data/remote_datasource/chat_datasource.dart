import 'package:utilities/data/dto/chat.dart';
import 'package:utilities/utilities.dart';

class ChatDataSource {
  final String baseUrl;

  ChatDataSource({required this.baseUrl});

  Future<void> createChat({
    required final ChatCreateDto dto,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/Chat",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );


  Future<void> readChat({
    required final Function(GenericResponse<List<ChatReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/Chat",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readChatByUserId({
    required final String userId,
    required final Function(GenericResponse<List<ChatReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/Chat/$userId",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

}
