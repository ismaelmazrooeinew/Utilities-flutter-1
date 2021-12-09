
class Error {
  String title;
  String message;
  int code;
  bool isConnectionError;

  Error({
    final this.title = "خطا",
    final this.message = "لطفا بعدا امتحان کنید",
    final this.code = 400,
    final this.isConnectionError = false,
  }) {
    if (isConnectionError) {
      title = "خطا";
      message = "ارتباط با اینترنت برقرار نیست";
    }
  }
}
