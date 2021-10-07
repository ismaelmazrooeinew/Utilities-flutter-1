import 'package:dio/dio.dart';

class DioRequest {
  // init dio class
  Dio dio = new Dio();

  /// this function for download file and write on path.
  /// please before start download , give permission from user for write on storage so call.
  /// value [url] , [path] , [timeOut] not be null.
  Future<void> downloadFile({
    required String url,
    required String path,
    required Duration timeOut,
    Function(int count, int total)? onReceiveProgress,
    Options? options,
    bool deleteOnError = false,
  }) async {
    try {
      dio.download(
        url,
        path,
        options: options,
        deleteOnError: deleteOnError,
        onReceiveProgress: onReceiveProgress,
      )..timeout(timeOut);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  /// value [url] , [timeOut] not be null.
  Future<Response> get({
    required String url,
    required Duration timeOut,
    Function(int count, int total)? onReceiveProgress,
    Options? options,
  }) async {
    try {
      var response = dio.getUri(
        Uri.parse(url),
        options: options,
        onReceiveProgress: onReceiveProgress,
      )..timeout(timeOut);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  /// value [url], [body] , [timeOut] not be null.
  Future<Response> post({
    required String url,
    required dynamic body,
    required Duration timeOut,
    Function(int count, int total)? onReceiveProgress,
    Function(int count, int total)? onSendProgress,
    Options? options,
  }) async {
    try {
      var response = dio.postUri(
        Uri.parse(url),
        data: body,
        options: options,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      )..timeout(timeOut);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  /// value [url], [body] , [timeOut] not be null.
  Future<Response> put({
    required String url,
    required dynamic body,
    required Duration timeOut,
    Function(int count, int total)? onReceiveProgress,
    Function(int count, int total)? onSendProgress,
    Options? options,
  }) async {
    try {
      var response = dio.putUri(
        Uri.parse(url),
        data: body,
        options: options,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      )..timeout(timeOut);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  /// value [url], [body] , [timeOut] not be null.
  Future<Response> delete({
    required String url,
    required dynamic body,
    required Duration timeOut,
    Options? options,
  }) async {
    try {
      var response = dio.deleteUri(
        Uri.parse(url),
        data: body,
        options: options,
      )..timeout(timeOut);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
