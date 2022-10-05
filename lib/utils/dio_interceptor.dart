import 'package:dio/dio.dart';
import 'package:utilities/utils/constants.dart';
import 'package:utilities/utils/http_interceptor.dart';
import 'package:utilities/utils/local_storage.dart';

Future<void> request(
  final String url,
  final EHttpMethod httpMethod,
  final Function(Response<dynamic> response) action,
  final Function(Response<dynamic> response) error, {
  final String? queryOrMutation,
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async {
  final Map<String, String> header = <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""};

  if (headers != null) header.addAll(headers);
  final Dio dio = Dio();
  Response response = Response(requestOptions: RequestOptions(path: ''));
  try {
    dynamic params;
    if (body != null) {
      if (encodeBody)
        params = body.toJson();
      else
        params = body;
    }

    // if (httpMethod == EHttpMethod.get) {
    //   Response response = await dio.get(url, options: Options(headers: header));
    //   if (response.statusCode! > 199 && response.statusCode! < 300) {
    //     action(response);
    //   } else {
    //     error(response);
    //   }
    // }
    //
    // if (httpMethod == EHttpMethod.post) {
    //   Response response = await dio.post(url, data: params, options: Options(headers: header));
    //   if (response.statusCode! > 199 && response.statusCode! < 300) {
    //     action(response);
    //   } else {
    //     error(response);
    //   }
    // }
    // if (httpMethod == EHttpMethod.put) {
    //   Response response = await dio.put(url, data: params, options: Options(headers: header));
    //   if (response.statusCode! > 199 && response.statusCode! < 300) {
    //     action(response);
    //   } else {
    //     error(response);
    //   }
    // }
    //
    // if (httpMethod == EHttpMethod.patch) {
    //   Response response = await dio.patch(url, data: params, options: Options(headers: header));
    //   if (response.statusCode! > 199 && response.statusCode! < 300) {
    //     action(response);
    //   } else {
    //     error(response);
    //   }
    // }
    //
    // if (httpMethod == EHttpMethod.delete) {
    //   Response response = await dio.delete(url, options: Options(headers: header));
    //   if (response.statusCode! > 199 && response.statusCode! < 300) {
    //     action(response);
    //   } else {
    //     error(response);
    //   }
    // }

    if (httpMethod == EHttpMethod.get) response = await dio.get(url, options: Options(headers: header));
    if (httpMethod == EHttpMethod.post) response = await dio.post(url, data: params, options: Options(headers: header));
    if (httpMethod == EHttpMethod.put) response = await dio.put(url, data: params, options: Options(headers: header));
    if (httpMethod == EHttpMethod.patch) response = await dio.patch(url, data: params, options: Options(headers: header));
    if (httpMethod == EHttpMethod.delete) response = await dio.delete(url, options: Options(headers: header));
    // ignore: avoid_catches_without_on_clauses
    if (response.statusCode! > 199 && response.statusCode! < 300) {
      action(response);
    } else {
      error(response);
    }
  } catch (e) {
    error(response);
  }
}

Future<void> httpGet({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Map<String, String>? headers,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.get,
      action,
      error,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> httpPost({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.post,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> httpPut({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.put,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> patch({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.patch,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> httpDelete({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Map<String, String>? headers,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.delete,
      action,
      error,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );
