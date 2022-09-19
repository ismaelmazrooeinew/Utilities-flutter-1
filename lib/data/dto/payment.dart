import 'package:utilities/utilities.dart';

class PaymentReadDto {
  PaymentReadDto({
    this.result,
    this.status,
    this.message,
  });

  final String? result;
  final int? status;
  final String? message;

  factory PaymentReadDto.fromJson(String str) => PaymentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentReadDto.fromMap(Map<String, dynamic> json) => PaymentReadDto(
    result: json["result"] == null ? null : json["result"],
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toMap() => {
    "result": result == null ? null : result,
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}
