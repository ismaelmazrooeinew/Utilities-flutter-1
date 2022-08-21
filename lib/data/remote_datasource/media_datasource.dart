import 'dart:io';
import 'dart:ui';

import 'package:utilities/utilities.dart';

class MediaDataSource {
  final String baseUrl;

  MediaDataSource({required this.baseUrl});

  Future<void> create({
    final List<File>? files,
    final List<String>? links,
    required final String useCase,
    required final VoidCallback action,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? notificationId,
  }) async {
    files?.forEach((final File file) async {
      final Response<dynamic> i = await GetConnect()
          .post(
        '$baseUrl/Media',
        FormData(
          <String, dynamic>{
            'Files': <MultipartFile>[MultipartFile(file, filename: file.path)],
            'UseCase': useCase,
            'CategoryId': categoryId,
            'ContentId': contentId,
            'ProductId': productId,
            'UserId': userId,
            'NotificationId': notificationId,
          },
        ),
        headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        },
        contentType: "multipart/form-data",

      );
      logger.w(files.length);
      logger.w(productId);
      logger.w(useCase);
      logger.w(i.statusCode);
      logger.w(i.bodyString);
    });
    links?.forEach((final String link) async {
      final Response<dynamic> i = await GetConnect().post(
        '$baseUrl/Media',
        FormData(
          <String, dynamic>{
            'Links': <String>[link],
            'UseCase': useCase,
            'CategoryId': categoryId,
            'ContentId': contentId,
            'ProductId': productId,
            'UserId': userId,
            'NotificationId': notificationId,
          },
        ),
        headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
      );
      logger.i(i.statusCode);
      logger.i(i.bodyString);
    });
    action();
  }

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
