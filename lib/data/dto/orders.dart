// To parse this JSON data, do
//
//     final orderReadDto = orderReadDtoFromMap(jsonString);

import 'dart:convert';

class OrdersReadDto {
  OrdersReadDto({
    this.description,
    this.discountCode,
    this.userId,
    this.orderDetails,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.discountPercent,
    this.sendPrice,
    this.sendType,
    this.payType,
    this.payNumber,
    this.receivedDate,
  });

  final String? description;
  final String? discountCode;
  final String? userId;
  final List<OrderDetail>? orderDetails;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? status;
  final int? discountPercent;
  final int? sendPrice;
  final int? sendType;
  final int? payType;
  final String? payNumber;
  final String? receivedDate;

  factory OrdersReadDto.fromJson(String str) => OrdersReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersReadDto.fromMap(Map<String, dynamic> json) => OrdersReadDto(
        description: json["description"] == null ? null : json["description"],
        discountCode: json["discountCode"] == null ? null : json["discountCode"],
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        status: json["status"] == null ? null : json["status"],
        discountPercent: json["discountPercent"] == null ? null : json["discountPercent"],
        sendPrice: json["sendPrice"] == null ? null : json["sendPrice"],
        sendType: json["sendType"] == null ? null : json["sendType"],
        payType: json["payType"] == null ? null : json["payType"],
        payNumber: json["payNumber"] == null ? null : json["payNumber"],
        receivedDate: json["receivedDate"] == null ? null : json["receivedDate"],
        orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "description": description == null ? null : description,
        "discountCode": discountCode == null ? null : discountCode,
        "userId": userId == null ? null : userId,
        "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "status": status == null ? null : status,
        "discountPercent": discountPercent == null ? null : discountPercent,
        "sendPrice": sendPrice == null ? null : sendPrice,
        "sendType": sendType == null ? null : sendType,
        "payType": payType == null ? null : payType,
        "payNumber": payNumber == null ? null : payNumber,
        "receivedDate": receivedDate == null ? null : receivedDate,
      };
}

class OrderDetail {
  OrderDetail({
    this.orderId,
    this.productId,
    this.price,
    this.count,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  final String? orderId;
  final String? productId;
  final int? price;
  final int? count;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
        orderId: json["orderId"] == null ? null : json["orderId"],
        productId: json["productId"] == null ? null : json["productId"],
        price: json["price"] == null ? null : json["price"],
        count: json["count"] == null ? null : json["count"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "orderId": orderId == null ? null : orderId,
        "productId": productId == null ? null : productId,
        "price": price == null ? null : price,
        "count": count == null ? null : count,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
      };
}
