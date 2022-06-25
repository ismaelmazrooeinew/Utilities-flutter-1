import 'package:utilities/utilities.dart';

class NotificationDataSource {
  final String baseUrl;

  NotificationDataSource({required this.baseUrl});

  Future<void> create({
    required final NotificationReadDto dto,
    required final Function(GenericResponse<NotificationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Notification",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, NotificationReadDto.fromMap)),
       error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, NotificationReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<NotificationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/Notification",
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, NotificationReadDto.fromMap)),
      );

}
