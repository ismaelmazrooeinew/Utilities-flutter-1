import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/media.dart';
import 'package:utilities/utils/constants.dart';
import 'package:utilities/utils/dio_interceptor.dart';
import 'package:utilities/utils/local_storage.dart';

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
    final String? chatId,
    final String? notificationId,
    final String? size,
  }) async {
    Dio dio = Dio();
    files?.forEach((final File file) async {
      final Response<dynamic> i = await dio.post(
        '$baseUrl/Media',
        data: FormData.fromMap({
          'Files': await MultipartFile.fromFile(file.path, filename: 'image.jpg'),
          // 'Files': <MultipartFile>[await MultipartFile(file.path, filename: file.path)],
          'UseCase': useCase,
          'CategoryId': categoryId,
          'ContentId': contentId,
          'ProductId': productId,
          'UserId': userId,
          'ChatId': chatId,
          'NotificationId': notificationId,
          'Size': size,
        }),
        //  {
        //   'Files': await MultipartFile.fromFile(file.path, filename: 'image.jpg'),
        //   // 'Files': <MultipartFile>[await MultipartFile(file.path, filename: file.path)],
        //   'UseCase': useCase,
        //   'CategoryId': categoryId,
        //   'ContentId': contentId,
        //   'ProductId': productId,
        //   'UserId': userId,
        //   'NotificationId': notificationId,
        //   'Size': size,
        // },
        options: Options(headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        }),
      );
    });
    links?.forEach((final String link) async {
      final Response<dynamic> i = await dio.post(
        '$baseUrl/Media',
        data: {
          'Links': <String>[link],
          'UseCase': useCase,
          'CategoryId': categoryId,
          'ContentId': contentId,
          'ProductId': productId,
          'UserId': userId,
          'ChatId': chatId,
          'NotificationId': notificationId,
          'Size': size,
        },
        options: Options(
          headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
        ),
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
    final String? chatId,
    final String? notificationId,
    ProgressCallback? onSendProgress,
    final String? size,
    Duration? timeout,
    required final Function(GenericResponse, bool isEnd) onResponse,
    required final Function(GenericResponse response) onError,
  }) async {
    Dio dio = Dio();
    for (int i = 0; i < files!.length; i++) {
      File file = files[i];
      String fileName = file.path.split('/')[file.path.split('/').length - 1];
      final Response<dynamic> response = await dio.post(
        '$baseUrl/Media',
        onSendProgress: onSendProgress,
        data: FormData.fromMap({
          'Files': await MultipartFile.fromFile(file.path, filename: fileName),
          // 'Files': <MultipartFile>[await MultipartFile(file.path, filename: file.path)],
          'UseCase': useCase,
          'CategoryId': categoryId,
          'ContentId': contentId,
          'ProductId': productId,
          'UserId': userId,
          'ChatId': chatId,
          'NotificationId': notificationId,
          'Size': size,
        }),
        options: Options(headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        }),
      );

      if (response.statusCode == 200) {
        if (i == files.length - 1) {
          action();
        } else {
          onError(GenericResponse.fromJson(response.data));
        }
      }

      // httpPost(
      //   url: "$baseUrl/Media",
      //   body: FormData(
      //     <String, dynamic>{
      //       'Files': <MultipartFile>[MultipartFile(file, filename: file.path)],
      //       'UseCase': useCase,
      //       'CategoryId': categoryId,
      //       'ContentId': contentId,
      //       'ProductId': productId,
      //       'UserId': userId,
      //       'NotificationId': notificationId,
      //       'Size': size,
      //     },
      //   ),
      //   // action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap), i == files.length - 1),
      //   action: (Response response) => i == files.length - 1 ? action() : null,
      //   error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      //   headers: <String, String>{
      //     "Authorization": getString(UtilitiesConstants.token) ?? "",
      //   },
      // );
    }
  }

  Future<void> createServer2({
    final List<File>? files,
    final List<String>? links,
    required final String useCase,
    required final VoidCallback action,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? chatId,
    final String? notificationId,
    final String? size,
    required final Function(GenericResponse, bool isEnd) onResponse,
    required final Function(GenericResponse response) onError,
  }) async {
    for (int i = 0; i < files!.length; i++) {
      File file = files[i];
      httpPost(
        url: "$baseUrl/Media",
        body: {
          'Files': await MultipartFile.fromFile(file.path, filename: 'image.jpg'),
          'UseCase': useCase,
          'CategoryId': categoryId,
          'ContentId': contentId,
          'ProductId': productId,
          'UserId': userId,
          'ChatId': chatId,
          'NotificationId': notificationId,
          'Size': size,
        },
        // action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap), i == files.length - 1),
        action: (Response response) => i == files.length - 1 ? action() : null,
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        },
      );
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
    final String? chatId,
    final String? notificationId,
    final String? size,
  }) async {
    // int i = 0;

    for (int i = 0; i < fileBytes.length; i++) {
      Uint8List files = fileBytes[i];
      final List<int> _selectedFile = files;
      final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('$baseUrl/Media'));
      request.fields['UseCase'] = useCase;
      if (categoryId != null) {
        request.fields['CategoryId'] = categoryId;
      }

      if (productId != null) {
        request.fields['ProductId'] = productId;
      }
      if (chatId != null) {
        request.fields['ChatId'] = chatId;
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
          if (i == fileBytes.length - 1) {
            action();
          }
        }
      });
    }

    if (links != null) {
      Dio dio = Dio();
      links.forEach((final String link) async {
        final Response<dynamic> i = await dio.post(
          '$baseUrl/Media',
          data: {
            'Links': <String>[link],
            'UseCase': useCase,
            'CategoryId': categoryId,
            'ContentId': contentId,
            'ProductId': productId,
            'ChatId': chatId,
            'UserId': userId,
            'NotificationId': notificationId,
            'Size': size ?? "",
          },
          options: Options(
            headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
          ),
        );
      });

      action();
    }
  }

  Future<void> createWebV2({
    required final List<PlatformFile> files,
    required final String useCase, //media
    required final VoidCallback action,
    final VoidCallback? error,
    final List<String>? links,
    final String? categoryId,
    final String? contentId,
    final String? productId, //8f11171f-c0a4-4a70-7fe2-08da91550c6f
    final String? userId,
    final String? chatId,
    final String? notificationId,
    final String? size,
  }) async {
    // int i = 0;

    for (int i = 0; i < files.length; i++) {
      PlatformFile platformFile = files[i];
      Uint8List? uint8list = platformFile.bytes;
      final List<int> _selectedFile = uint8list!;
      String fileName = platformFile.name;
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

      if (chatId != null) {
        request.fields['ChatId'] = chatId;
      }

      if (notificationId != null) {
        request.fields['NotificationId'] = notificationId;
      }
      if (size != null) {
        request.fields['Size'] = size;
      }

      request.headers['Authorization'] = getString(UtilitiesConstants.token) ?? "";

      request.files.add(http.MultipartFile.fromBytes('Files', _selectedFile, filename: fileName));

      await request.send().then((final http.StreamedResponse response) {
        if (response.statusCode == 200) {
          if (i == files.length - 1) {
            action();
          }
        } else {
          if (i == files.length - 1) {
            error!();
          }
        }
      });
    }

    if (links != null) {
      Dio dio = Dio();
      links.forEach((final String link) async {
        final Response<dynamic> i = await dio.post(
          '$baseUrl/Media',
          data: {
            'Links': <String>[link],
            'UseCase': useCase,
            'CategoryId': categoryId,
            'ContentId': contentId,
            'ProductId': productId,
            'UserId': userId,
            'ChatId': chatId,
            'NotificationId': notificationId,
            'Size': size ?? "",
          },
          options: Options(
            headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
          ),
        );
      });

      action();
    }
  }

  // Future<Response> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, {Map<String, String> headers}) async {
  //   try {
  //     if (Foundation.kDebugMode) {
  //       print('====> API Call: $uri\nToken: $token');
  //       print('====> API Body: $body with ${multipartBody.length} image ');
  //     }
  //     http.MultipartRequest _request = http.MultipartRequest('POST', Uri.parse('$baseUrl/Media'));
  //     _request.headers.addAll(headers ?? _mainHeaders);
  //     for (MultipartBody multipart in multipartBody) {
  //       if (multipart.file != null) {
  //         if (Foundation.kIsWeb) {
  //           Uint8List _list = await multipart.file.readAsBytes();
  //           Http.MultipartFile _part = Http.MultipartFile(
  //             multipart.key,
  //             multipart.file.readAsBytes().asStream(),
  //             _list.length,
  //             filename: basename(multipart.file.path),
  //             contentType: MediaType('image', 'jpg'),
  //           );
  //           _request.files.add(_part);
  //         } else {
  //           File _file = File(multipart.file.path);
  //           _request.files.add(Http.MultipartFile(
  //             multipart.key,
  //             _file.readAsBytes().asStream(),
  //             _file.lengthSync(),
  //             filename: _file.path.split('/').last,
  //           ));
  //         }
  //       }
  //     }
  //     _request.fields.addAll(body);
  //     Http.Response _response = await Http.Response.fromStream(await _request.send());
  //     Response response = handleResponse(_response, uri);
  //     if (Foundation.kDebugMode) {
  //       print('====> API Response: [${response.statusCode}] $uri\n${response.body}');
  //     }
  //     return response;
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}

class MultipartBody {
  String key;
  File file;

  MultipartBody(this.key, this.file);
}
