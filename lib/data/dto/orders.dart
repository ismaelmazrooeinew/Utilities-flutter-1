import 'dart:convert';

import 'package:utilities/data/dto/product.dart';

class OrdersReadDto {
  OrdersReadDto({
    this.description,
    this.showProducts,
    this.showForms,
    this.showCategories,
    this.showMedia,
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

  final bool? showProducts;
  final bool? showMedia;
  final bool? showForms;
  final bool? showCategories;
  final String? description;
  final String? discountCode;
  final String? userId;
  final List<OrderDetail>? orderDetails;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? status;
  final int? discountPercent;
  final double? sendPrice;
  final int? sendType;
  final int? payType;
  final String? payNumber;
  final String? receivedDate;

  factory OrdersReadDto.fromJson(String str) => OrdersReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersReadDto.fromMap(Map<String, dynamic> json) => OrdersReadDto(
        description: json["description"],
        showProducts: json["showProducts"],
        showMedia: json["showMedia"],
        showForms: json["showForms"],
        showCategories: json["showCategories"],
        discountCode: json["discountCode"],
        userId: json["userId"],
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        status: json["status"],
        discountPercent: json["discountPercent"],
        sendPrice: json["sendPrice"],
        sendType: json["sendType"],
        payType: json["payType"],
        payNumber: json["payNumber"],
        receivedDate: json["receivedDate"],
        orderDetails: json["orderDetails"] == null ? null : List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "discountCode": discountCode,
        "showProducts": showProducts,
        "showMedia": showMedia,
        "showForms": showForms,
        "showCategories": showCategories,
        "userId": userId == null ? null : userId,
        "orderDetails": List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "status": status,
        "discountPercent": discountPercent,
        "sendPrice": sendPrice,
        "sendType": sendType,
        "payType": payType,
        "payNumber": payNumber,
        "receivedDate": receivedDate,
      };
}

class OrderDetail {
  OrderDetail({
    this.orderId,
    this.productId,
    this.price,
    this.count,
    this.id,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  final String? orderId;
  final String? productId;
  final double? price;
  final int? count;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final ProductReadDto? product;

  factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
        orderId: json["orderId"],
        productId: json["productId"],
        price: json["price"],
        count: json["count"],
        id: json["id"],
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "orderId": orderId,
        "productId": productId,
        "price": price,
        "count": count,
        "id": id,
        "product": product == null ? null : product!.toMap(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class OrderCreateUpdateDto {
  OrderCreateUpdateDto({
    this.id,
    this.description,
    this.status,
    this.receivedDate,
    this.totalPrice,
    this.discountPercent,
    this.discountCode,
    this.discountPrice,
    this.sendPrice,
    this.payType,
    this.sendType,
    this.orderDetails,
  });

  final String? id;
  final String? description;
  final int? status;
  final String? receivedDate;
  final int? totalPrice;
  final int? discountPercent;
  final String? discountCode;
  final int? discountPrice;
  final int? sendPrice;
  final int? payType;
  final int? sendType;
  final List<OrderDetail>? orderDetails;

  factory OrderCreateUpdateDto.fromJson(String str) => OrderCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderCreateUpdateDto.fromMap(Map<String, dynamic> json) => OrderCreateUpdateDto(
        id: json["id"],
        description: json["description"],
        status: json["status"],
        receivedDate: json["receivedDate"],
        totalPrice: json["totalPrice"],
        discountPercent: json["discountPercent"],
        discountCode: json["discountCode"],
        discountPrice: json["discountPrice"],
        sendPrice: json["sendPrice"],
        payType: json["payType"],
        sendType: json["sendType"],
        orderDetails: json["orderDetails"] == null ? null : List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "status": status,
        "receivedDate": receivedDate,
        "totalPrice": totalPrice,
        "discountPercent": discountPercent,
        "discountCode": discountCode,
        "discountPrice": discountPrice,
        "sendPrice": sendPrice,
        "payType": payType,
        "sendType": sendType,
        "orderDetails": sendType == null ? null : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
      };
}
