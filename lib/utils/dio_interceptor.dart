import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:utilities/utils/constants.dart';
import 'package:utilities/utils/http_interceptor.dart';
import 'package:utilities/utils/local_storage.dart';

Future<void> request(
  final String url,
  final EHttpMethod httpMethod,
  final Function(Response<dynamic> response) action,
  final Function(Response<dynamic> response) error, {
  final Function(String error)? failure,
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
}) async {
  final Map<String, String> header = <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""};

  log(url);
  if (headers != null) header.addAll(headers);
  final Dio dio = Dio();
  Response response = Response(requestOptions: RequestOptions(path: '', headers: header));
  try {
    dynamic params;
    if (body != null) {
      if (encodeBody)
        params = body.toJson();
      else
        params = body;
    }

    if (httpMethod == EHttpMethod.get) response = await dio.get(url, options: Options(headers: header));
    if (httpMethod == EHttpMethod.post) response = await dio.post(url, data: params, options: Options(headers: header));
    if (httpMethod == EHttpMethod.put) response = await dio.put(url, data: params, options: Options(headers: header));
    if (httpMethod == EHttpMethod.patch) response = await dio.patch(url, data: params, options: Options(headers: header));
    if (httpMethod == EHttpMethod.delete) response = await dio.delete(url, options: Options(headers: header));
    if (response.isSuccessful()) {
      action(response);
    } else {
      error(response);
    }
  } catch (e) {
    if (failure != null) {
      failure('error');
    }
  }

  response.log();
}

Future<void> httpGet({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Function(String error)? failure,
  final Map<String, String>? headers,
}) async =>
    request(
      url,
      EHttpMethod.get,
      action,
      error,
      headers: headers,
      failure: (String error) => failure!,
    );

Future<void> httpPost({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Function(String error)? failure,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
}) async =>
    request(url, EHttpMethod.post, action, error, body: body, encodeBody: encodeBody, headers: headers, failure: failure);

Future<void> httpPut({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Function(String error)? failure,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
}) async =>
    request(
      url,
      EHttpMethod.put,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      failure: (String error) => failure!,
    );

Future<void> patch({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Function(String error)? failure,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
}) async =>
    request(
      url,
      EHttpMethod.patch,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      failure: (String error) => failure!,
    );

Future<void> httpDelete({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Function(String error)? failure,
  final Map<String, String>? headers,
}) async =>
    request(
      url,
      EHttpMethod.delete,
      action,
      error,
      headers: headers,
      failure: (String error) => failure!,
    );

extension HTTP on Response<dynamic> {
  bool isSuccessful() => (statusCode ?? 0) >= 200 && (statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (statusCode ?? 0) >= 500 && (statusCode ?? 0) <= 599 ? true : false;

  void log({final String params = ""}) {
    print(
      "${this.requestOptions.method} - ${this.requestOptions.path} - $statusCode \nPARAMS: $params \nRESPONSE: ${this.data}",
    );
  }
}
