part of '../utilities.dart';

class Error {
  String title;
  String message;
  int code;
  bool isConnectionError;

  Error({
    this.title = "خطا",
    this.message = "لطفا بعدا امتحان کنید",
    this.code = 400,
    this.isConnectionError = false,
  }) {
    if (isConnectionError) {
      title = "خطا";
      message = "ارتباط با اینترنت برقرار نیست";
    }
  }
}
