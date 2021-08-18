part of '../utilities.dart';

Future<void> request(String url, EHttpMethod httpMethod, action(http.Response? response), error(http.Response? response), {body}) async {
  final String? token = getString(Constant.token);

  Map<String, String> headers = {"Content-Type": "application/json", "Authorization": token ?? ""};

  http.Response? response;
  if (httpMethod == EHttpMethod.get) response = await http.get(Uri.parse(url), headers: headers);
  if (httpMethod == EHttpMethod.post) response = await http.post(Uri.parse(url), body: body != null ? body.toJson() : null, headers: headers);
  if (httpMethod == EHttpMethod.put) response = await http.put(Uri.parse(url), body: body != null ? body.toJson() : null, headers: headers);
  if (httpMethod == EHttpMethod.patch) response = await http.patch(Uri.parse(url), body: body != null ? body.toJson() : null, headers: headers);
  if (httpMethod == EHttpMethod.delete) response = await http.delete(Uri.parse(url), headers: headers);

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
  required action(http.Response? response),
  required error(http.Response? response),
}) async =>
    await request(url, EHttpMethod.get, action, error);

Future<void> post({
  required String url,
  required action(http.Response? response),
  required error(http.Response? response),
  body,
}) async =>
    await request(url, EHttpMethod.post, action, error, body: body);

Future<void> put({
  required String url,
  required action(http.Response? response),
  required error(http.Response? response),
  body,
}) async =>
    await request(url, EHttpMethod.put, action, error, body: body);

Future<void> patch({
  required String url,
  required action(http.Response? response),
  required error(http.Response? response),
  body,
}) async =>
    await request(url, EHttpMethod.patch, action, error, body: body);

Future<void> delete({
  required String url,
  required action(http.Response? response),
  required error(http.Response? response),
}) async =>
    await request(url, EHttpMethod.delete, action, error);

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP on http.Response {
  bool isSuccessful() => this.statusCode >= 200 && this.statusCode <= 299 ? true : false;

  bool isServerError() => this.statusCode >= 500 && this.statusCode <= 599 ? true : false;

  log() => print("${this.request!.method} - ${this.request!.url} - ${this.statusCode} - RESPONSE: ${this.body}");

  completeLog({String? params}) => print(
        "${this.request!.method} - ${this.request!.url} - ${this.statusCode} HEADERS: ${this.headers} - PARAMS: $params - RESPONSE: ${this.body}",
      );
}
