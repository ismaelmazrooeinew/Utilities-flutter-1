part of '../utilities.dart';

GetConnect getConnect = GetConnect(
  followRedirects: false,
  timeout: Duration(minutes: 60),
  allowAutoSignedCert: true,
  sendUserAgent: true,
  userAgent: "ThisIsFrozenSun",
  maxRedirects: 10,
  maxAuthRetries: 3,
);

Future<void> request(
  String url,
  EHttpMethod httpMethod,
  action(Response response),
  error(Response response), {
  dynamic body,
  bool encodeBody = true,
  Map<String, String>? headers,
}) async {
  Map<String, String> header = {"Authorization": getString(Constant.token) ?? ""};

  if (headers != null) header.addAll(headers);

  Response response = Response();
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
  }

  if (body != null && !encodeBody)
    response.completeLog(params: body.toJson());
  else
    response.log();
  if (response.isSuccessful())
    action(response);
  else
    error(response);
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
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.post, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> put({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.put, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> patch({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.patch, action, error, body: body, encodeBody: encodeBody, headers: headers);

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

  void log() {
    print("${this.request!.method} - ${this.request!.url} - ${this.statusCode}");
    print("RESPONSE: ${this.body}");
  }

  void completeLog({String? params}) {
    print("${this.request!.method} - ${this.request!.url} - ${this.statusCode} HEADERS: ${this.headers}");
    print("PARAMS: $params - RESPONSE: ${this.body}");
  }
}
