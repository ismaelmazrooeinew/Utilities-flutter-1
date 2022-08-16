// To parse this JSON data, do
//
//     final transactionReadDto = transactionReadDtoFromMap(jsonString);

import 'dart:convert';

class TransactionReadDto {
  TransactionReadDto({
    this.result,
    this.status,
    this.message,
  });

  final List<Result>? result;
  final int? status;
  final String? message;

  factory TransactionReadDto.fromJson(String str) => TransactionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionReadDto.fromMap(Map<String, dynamic> json) => TransactionReadDto(
    result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "result": List<dynamic>.from(result!.map((x) => x.toMap())),
    "status": status,
    "message": message,
  };
}

class Result {
  Result({
    this.id,
    this.userId,
    this.amount,
    this.descriptions,
    this.statusId,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? userId;
  final int? amount;
  final String? descriptions;
  final int? statusId;
  final String? paymentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    userId: json["userId"],
    amount: json["amount"],
    descriptions: json["descriptions"],
    statusId: json["statusId"],
    paymentId: json["paymentId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "userId": userId,
    "amount": amount,
    "descriptions": descriptions,
    "statusId": statusId,
    "paymentId": paymentId,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
