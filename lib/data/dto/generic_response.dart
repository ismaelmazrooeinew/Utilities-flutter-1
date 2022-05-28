import 'package:utilities/utilities.dart';

class GenericResponse<T> {
  GenericResponse({
    this.result,
    this.status = 200,
    this.message = "",
  });

  factory GenericResponse.fromJson(final String str) => GenericResponse.fromMap(json.decode(str));

  factory GenericResponse.fromMap(final Map<String, dynamic> json) => GenericResponse(
        status: json["Status"] ?? 200,
        message: json["Message"] ?? "",
        result: json["Result"] ?? null,
      );

  final int status;
  final String message;
  final T? result;
}
