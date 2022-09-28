import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/notification.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class NotificationDataSource2 {
  final String baseUrl;

  NotificationDataSource2({required this.baseUrl});

  Future<void> read({
    required final Function(GenericResponse<NotificationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Notification",
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.data, fromMap: NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> updateSeenStatus({
    required final List<String> notificationIds,
    required final int status,
    required final VoidCallback onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        encodeBody: false,
        url: "$baseUrl/Notification/UpdateSeenStatus?seenStatus=$status",
        body: notificationIds,
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
