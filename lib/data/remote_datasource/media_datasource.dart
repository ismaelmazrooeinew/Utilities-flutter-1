import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:utilities/utilities.dart';
import 'package:http/http.dart' as http;

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
    final String? size,
  }) async {
    files?.forEach((final File file) async {
      final Response<dynamic> i = await GetConnect().post(
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
            'Size': size,
          },
        ),
        headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        },
        contentType: "multipart/form-data",
      );
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
            'Size': size,
          },
        ),
        headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
      );
    });
    action();
  }

  Future<void> createServer({
    final List<File>? files,
    final List<String>? links,
    required final String useCase,
    required final VoidCallback action,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? notificationId,
    final String? size,
    required final Function(GenericResponse, bool isEnd) onResponse,
    required final Function(GenericResponse response) onError,
  }) async {
    for (int i = 0; i < files!.length; i++) {
      File file = files[i];
      httpPost(
        url: "$baseUrl/Media",
        body: FormData(
          <String, dynamic>{
            'Files': <MultipartFile>[MultipartFile(file, filename: file.path)],
            'UseCase': useCase,
            'CategoryId': categoryId,
            'ContentId': contentId,
            'ProductId': productId,
            'UserId': userId,
            'NotificationId': notificationId,
            'Size': size,
          },
        ),
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap), i == files.length - 1),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        },
      );

      if (i == files.length - 1) {
        action();
      }
    }
  }

  Future<void> createWeb({
    required final List<Uint8List> fileBytes,
    required final String useCase, //media
    required final VoidCallback action,
    final List<String>? links,
    final String? categoryId,
    final String? contentId,
    final String? productId, //8f11171f-c0a4-4a70-7fe2-08da91550c6f
    final String? userId,
    final String? notificationId,
    final String? size,
  }) async {
    fileBytes.forEach((final Uint8List files) async {
      final List<int> _selectedFile = files;
      final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('$baseUrl/Media'));
      request.fields['UseCase'] = useCase;
      if (categoryId != null) {
        request.fields['CategoryId'] = categoryId;
      }

      if (productId != null) {
        request.fields['ProductId'] = productId;
      }
      if (userId != null) {
        request.fields['UserId'] = userId;
      }
      if (notificationId != null) {
        request.fields['NotificationId'] = notificationId;
      }
      if (size != null) {
        request.fields['Size'] = size;
      }

      request.headers['Authorization'] = getString(UtilitiesConstants.token) ?? "";

      request.files.add(http.MultipartFile.fromBytes('Files', _selectedFile, filename: "file111.png"));

      await request.send().then((final http.StreamedResponse response) {
        if (response.statusCode == 200) {
          print('Upload ok');
        }
      });
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
            'Size': size ?? "",
          },
        ),
        headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
      );
    });

    action();
  }

  Future<void> createWeb2({
    required final List<Uint8List> fileBytes,
    final List<String>? links,
    required final String useCase,
    required final VoidCallback action,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? notificationId,
    final String? size,
  }) async {
    fileBytes.forEach((final Uint8List file) async {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/Media'));
      request.fields['UseCase'] = useCase;
      request.fields['CategoryId'] = categoryId ?? "";
      request.fields['ContentId'] = contentId ?? "";
      request.fields['ProductId'] = productId ?? "";
      request.fields['UserId'] = userId ?? "";
      request.fields['NotificationId'] = notificationId ?? "";
      request.fields['Size'] = size ?? "";
      request.headers['Authorization'] = getString(UtilitiesConstants.token) ?? "";

      List<int> list = file.cast();
      request.files.add(http.MultipartFile.fromBytes('Files', list, filename: "image01.png"));

      var response = await request.send();

      var responseData = await response.stream.toBytes();
      var res = String.fromCharCodes(responseData);
      print(res);
    });
    links?.forEach((final String link) async {
      final Response<dynamic> i = await GetConnect().post(
        '$baseUrl/Media',
        FormData(
          <String, dynamic>{
            'Links': <String>[link],
            'UseCase': useCase ?? "",
            'CategoryId': categoryId ?? "",
            'ContentId': contentId ?? "",
            'ProductId': productId ?? "",
            'UserId': userId ?? "",
            'NotificationId': notificationId ?? "",
            'Size': size ?? "",
          },
        ),
        headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
      );
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
