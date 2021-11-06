part of '../utilities.dart';

GetConnect getConnect = GetConnect(
  followRedirects: true,
  timeout: Duration(minutes: 60),
  allowAutoSignedCert: true,
  sendUserAgent: true,
  userAgent: "ThisIsFrozenSun",
  maxRedirects: 3,
  maxAuthRetries: 3,
);

Future<void> request(
  String url,
  EHttpMethod httpMethod,
  action(Response response),
  error(Response response), {
  dynamic body,
  Map<String, String>? headers,
}) async {
  Map<String, String> header = {
    "Content-Type": "application/json",
    "Authorization": getString(Constant.token) ?? "",
  };

  if (headers != null) header.addAll(headers);

  Response response = Response();
  if (httpMethod == EHttpMethod.get) response = await getConnect.get(url, headers: header);
  if (httpMethod == EHttpMethod.post) response = await getConnect.post(url, body.toJson(), headers: header);
  if (httpMethod == EHttpMethod.put) response = await getConnect.put(url, body.toJson(), headers: header);
  if (httpMethod == EHttpMethod.patch) response = await getConnect.patch(url, body.toJson(), headers: header);
  if (httpMethod == EHttpMethod.delete) response = await getConnect.delete(url, headers: header);

  if (body != null) {
    response.completeLog(params: body.toJson());
  } else {
    response.log();
  }
  if (response.isSuccessful()) {
    action(response);
  } else {
    error(response);
  }
}

Future<void> get({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(url, EHttpMethod.get, action, error, headers: headers);

Future<void> post({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  body,
}) async =>
    await request(url, EHttpMethod.post, action, error, body: body, headers: headers);

Future<void> put({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  body,
}) async =>
    await request(url, EHttpMethod.put, action, error, body: body, headers: headers);

Future<void> patch({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  body,
}) async =>
    await request(url, EHttpMethod.patch, action, error, body: body, headers: headers);

Future<void> delete({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(url, EHttpMethod.delete, action, error, headers: headers);

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP on Response {
  bool isSuccessful() => (this.statusCode ?? 0) >= 200 && (this.statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (this.statusCode ?? 0) >= 500 && (this.statusCode ?? 0) <= 599 ? true : false;

  void log() => print("${this.request!.method} - ${this.request!.url} - ${this.statusCode} - RESPONSE: ${this.body}");

  void completeLog({String? params}) => print(
        "${this.request!.method} - ${this.request!.url} - ${this.statusCode} HEADERS: ${this.headers} - PARAMS: $params - RESPONSE: ${this.body}",
      );
}
