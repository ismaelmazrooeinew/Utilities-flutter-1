part of '../utilities.dart';

Future request(String url, EHttpMethod httpMethod, action(http.Response response), error(http.Response response), {body}) async {
  Map<String, String> headers = {"Content-Type": "application/json"};

  http.Response response;
  if (httpMethod == EHttpMethod.get) response = await http.get(Uri.parse(url), headers: headers);
  if (httpMethod == EHttpMethod.post) response = body == null ? await http.post(Uri.parse(url), headers: headers) : await http.post(Uri.parse(url), body: body.toJson(), headers: headers);
  if (httpMethod == EHttpMethod.put) response = await http.put(Uri.parse(url), body: body.toJson(), headers: headers);
  if (httpMethod == EHttpMethod.patch) response = await http.patch(Uri.parse(url), body: body.toJson(), headers: headers);
  if (httpMethod == EHttpMethod.delete) response = await http.delete(Uri.parse(url), headers: headers);

  if (body != null)
    response.completeLog(params: body.toJson());
  else
    response.log();

  if (response.isSuccessful())
    action(response);
  else
    error(response);
}

Future get({
  @required String url,
  @required action(http.Response response),
  @required error(http.Response response),
}) async =>
    await request(url, EHttpMethod.get, action, error);

Future post({
  @required String url,
  @required action(http.Response response),
  @required error(http.Response response),
  body,
}) async =>
    await request(url, EHttpMethod.post, action, error, body: body);

Future put({
  @required String url,
  @required action(http.Response response),
  @required error(http.Response response),
  body,
}) async =>
    await request(url, EHttpMethod.put, action, error, body: body);

Future patch({
  @required String url,
  @required action(http.Response response),
  @required error(http.Response response),
  body,
}) async =>
    await request(url, EHttpMethod.patch, action, error, body: body);

Future delete({
  @required String url,
  @required action(http.Response response),
  @required error(http.Response response),
}) async =>
    await request(url, EHttpMethod.delete, action, error);

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP on http.Response {
  bool isSuccessful() => this.statusCode >= 200 && this.statusCode <= 299 ? true : false;

  bool isServerError() => this.statusCode >= 500 && this.statusCode <= 599 ? true : false;

  log() => print("${this.request.method} - ${this.request.url} - ${this.statusCode} - RESPONSE: ${this.body}");

  completeLog({String params}) => print(
        "METHOD: ${this.request.method} - URL: ${this.request.url} - STATUS CODE: ${this.statusCode} - RESPONSE: ${this.body} - PARAMS:$params",
      );
}
