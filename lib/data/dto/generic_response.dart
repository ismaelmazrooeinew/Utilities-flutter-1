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
        status: json["status"],
        message: json["message"],
        result: json["result"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
      );

  final int status;
  final String message;
  final T? result;
  final int? pageSize;
  final int? pageCount;
  final int? totalCount;
}

class GenericListResponse<T> {
  GenericListResponse({
    this.result,
    this.status = 200,
    this.message = "",
    this.pageSize,
    this.pageCount,
    this.totalCount,
  });

  factory GenericListResponse.fromJson(final String str) => GenericListResponse.fromMap(json.decode(str));

  factory GenericListResponse.fromMap(final dynamic json) => GenericListResponse(
        status: json["status"],
        message: json["message"],
        result: json["result"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
      );

  final int status;
  final String message;
  final List<T>? result;
  final int? pageSize;
  final int? pageCount;
  final int? totalCount;
}
