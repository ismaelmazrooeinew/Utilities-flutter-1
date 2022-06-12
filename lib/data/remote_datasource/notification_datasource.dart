import 'package:utilities/data/dto/notification.dart';
import 'package:utilities/utilities.dart';

class NotificationDataSource {
  final String baseUrl;

  NotificationDataSource({required this.baseUrl});

  Future<void> create({
    required final NotificationReadDto dto,
    required final Function(GenericResponse<List<NotificationReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Notification",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<List<NotificationReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/Notification",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

}
