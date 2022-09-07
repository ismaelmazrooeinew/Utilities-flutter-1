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
  Future<void> createWeb({
    required final List<Uint8List>  fileBytes,
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

      var request=http.MultipartRequest('POST',Uri.parse('$baseUrl/Media'));
      request.fields['UseCase']=useCase;
      request.fields['CategoryId']=categoryId!;
      request.fields['ContentId']=contentId!;
      request.fields['ProductId']=productId!;
      request.fields['UserId']=userId!;
      request.fields['NotificationId']=notificationId!;
      request.fields['Size']=size!;
      request.headers['Authorization']=getString(UtilitiesConstants.token) ?? "";

      List<int> list=file.cast();
      request.files.add(http.MultipartFile.fromBytes('fileeeeeee', list));

      var response=await request.send();

      response.stream.bytesToString().asStream().listen((event) {

        var parsJson=json.decode(event);
        print(parsJson);


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
            'Size': size,
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
