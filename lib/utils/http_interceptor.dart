part of '../utilities.dart';

GetConnect getConnect = GetConnect(
  followRedirects: true,
  timeout: Duration(minutes: 60),
);

Future<void> request(
  String url,
  EHttpMethod httpMethod,
  action(Response? response),
  error(Response? response), {
  body,
}) async {
  final String? token = getString(Constant.token);

  Map<String, String> headers = {"Content-Type": "application/json", "Authorization": token ?? ""};

  Response? response;
  if (httpMethod == EHttpMethod.get) response = await getConnect.get(url, headers: headers);
  if (httpMethod == EHttpMethod.post) response = await getConnect.post(url, body, headers: headers);
  if (httpMethod == EHttpMethod.put) response = await getConnect.put(url, body, headers: headers);
  if (httpMethod == EHttpMethod.patch) response = await getConnect.patch(url, body, headers: headers);
  if (httpMethod == EHttpMethod.delete) response = await getConnect.delete(url, headers: headers);

  if (body != null)
    response!.completeLog(params: body.toJson());
  else
    response!.log();
  if (response.isSuccessful())
    action(response);
  else
    error(response);
}

Future<void> get({
  required String url,
  required action(Response? response),
  required error(Response? response),
}) async =>
    await request(url, EHttpMethod.get, action, error);

Future<void> post({
  required String url,
  required action(Response? response),
  required error(Response? response),
  body,
}) async =>
    await request(url, EHttpMethod.post, action, error, body: body);

Future<void> put({
  required String url,
  required action(Response? response),
  required error(Response? response),
  body,
}) async =>
    await request(url, EHttpMethod.put, action, error, body: body);

Future<void> patch({
  required String url,
  required action(Response? response),
  required error(Response? response),
  body,
}) async =>
    await request(url, EHttpMethod.patch, action, error, body: body);

Future<void> delete({
  required String url,
  required action(Response? response),
  required error(Response? response),
}) async =>
    await request(url, EHttpMethod.delete, action, error);

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP on Response {
  bool isSuccessful() => (this.statusCode ?? 0) >= 200 && (this.statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (this.statusCode ?? 0) >= 500 && (this.statusCode ?? 0) <= 599 ? true : false;

  log() => print("${this.request!.method} - ${this.request!.url} - ${this.statusCode} - RESPONSE: ${this.body}");

  completeLog({String? params}) => print(
        "${this.request!.method} - ${this.request!.url} - ${this.statusCode} HEADERS: ${this.headers} - PARAMS: $params - RESPONSE: ${this.body}",
      );
}
