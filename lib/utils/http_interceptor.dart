part of '../utilities.dart';

GetConnect getConnect = GetConnect(
  followRedirects: false,
  timeout: const Duration(minutes: 60),
  allowAutoSignedCert: true,
  sendUserAgent: true,
  userAgent: "ThisIsFrozenSun",
  maxRedirects: 10,
  maxAuthRetries: 3,
);

Future<void> request<T>(
  final String url,
  final EHttpMethod httpMethod,
  final Function(Response<T> response) action,
  final Function(Response<T> response) error, {
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
}) async {
  final Map<String, String> header = <String, String>{"Authorization": getString(Constant.token) ?? ""};

  if (headers != null) header.addAll(headers);

  Response<T> response = Response<T>();
  try {
    dynamic params;
    if (body != null) {
      if (encodeBody)
        params = body.toJson();
      else
        params = body;
    }

    if (httpMethod == EHttpMethod.get) response = await getConnect.get(url, headers: header);
    if (httpMethod == EHttpMethod.post) response = await getConnect.post(url, params, headers: header);
    if (httpMethod == EHttpMethod.put) response = await getConnect.put(url, params, headers: header);
    if (httpMethod == EHttpMethod.patch) response = await getConnect.patch(url, params, headers: header);
    if (httpMethod == EHttpMethod.delete) response = await getConnect.delete(url, headers: header);
  } catch (e) {
    error(response);
    print(e);
  }

  if (body != null && encodeBody)
    response.completeLog(params: body.toJson());
  else
    response.log();
  if (response.isSuccessful())
    action(response);
  else
    error(response);
}

Future<void> get<T>({
  required final String url,
  required final Function(Response<T> response) action,
  required final Function(Response<T> response) error,
  final Map<String, String>? headers,
}) async =>
    request(url, EHttpMethod.get, action, error, headers: headers);

Future<void> post<T>({
  required final String url,
  required final Function(Response<T> response) action,
  required final Function(Response<T> response) error,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
}) async =>
    request(url, EHttpMethod.post, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> put<T>({
  required final String url,
  required final Function(Response<T> response) action,
  required final Function(Response<T> response) error,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
}) async =>
    request(url, EHttpMethod.put, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> patch<T>({
  required final String url,
  required final Function(Response<T> response) action,
  required final Function(Response<T> response) error,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
}) async =>
    request(url, EHttpMethod.patch, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> delete<T>({
  required final String url,
  required final Function(Response<T> response) action,
  required final Function(Response<T> response) error,
  final Map<String, String>? headers,
}) async =>
    request(url, EHttpMethod.delete, action, error, headers: headers);

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP<T> on Response<T> {
  bool isSuccessful() => (statusCode ?? 0) >= 200 && (statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (statusCode ?? 0) >= 500 && (statusCode ?? 0) <= 599 ? true : false;

  void log() {
    print("${this.request!.method} - ${this.request!.url} - $statusCode");
    print("RESPONSE: $body");
  }

  void completeLog({final String? params}) {
    print("${this.request!.method} - ${this.request!.url} - $statusCode HEADERS: $headers");
    print("PARAMS: $params - RESPONSE: $body");
  }
}
