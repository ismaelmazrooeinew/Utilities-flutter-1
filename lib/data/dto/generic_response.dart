import 'package:utilities/utilities.dart';

class GenericResponse<T> {
  GenericResponse({
    this.result,
    this.status = 200,
    this.message = "",
    this.pageSize,
    this.pageCount,
    this.totalCount,
  });

  factory GenericResponse.fromJson(final String str) => GenericResponse.fromMap(json.decode(str));

  factory GenericResponse.fromMap(final Map<String, dynamic> json) => GenericResponse(
        status: json["status"] ?? 200,
        message: json["message"] ?? "",
        result: json["result"] == null ? null : json["pageSize"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
      );

  final int status;
  final String message;
  final List<T>? result;
  final int? pageSize;
  final int? pageCount;
  final int? totalCount;
}
