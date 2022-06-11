import 'package:utilities/data/dto/notification.dart';
import 'package:utilities/utilities.dart';

class NotificationDataSource {
  final String baseUrl;

  NotificationDataSource({required this.baseUrl});

  Future<void> createNotification({
    required final NotificationReadDto dto,
    required final Function(GenericResponse<NotificationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/Notification",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readNotification({
    required final Function(GenericResponse<List<NotificationReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/Notification",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

}
