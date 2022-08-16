import 'dart:convert';

class TransactionReadDto {
  TransactionReadDto({
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
  final String? createdAt;
  final String? updatedAt;


  factory TransactionReadDto.fromJson(String str) => TransactionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionReadDto.fromMap(Map<String, dynamic> json) => TransactionReadDto(

    id: json["id"] == null ? null : json["id"],
    userId: json["userId"] == null ? null : json["userId"],
    amount: json["amount"] == null ? null : json["amount"],
    descriptions: json["descriptions"] == null ? null : json["descriptions"],
    statusId: json["statusId"] == null ? null : json["statusId"],
    paymentId: json["paymentId"] == null ? null : json["paymentId"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "userId": userId == null ? null : userId,
    "amount": amount == null ? null : amount,
    "descriptions": descriptions == null ? null : descriptions,
    "statusId": statusId == null ? null : statusId,
    "paymentId": paymentId == null ? null : paymentId,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}
