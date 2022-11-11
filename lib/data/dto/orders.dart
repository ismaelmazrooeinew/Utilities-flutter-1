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
    description: json["description"] == null ? null : json["description"],
    showProducts: json["showProducts"] == null ? null : json["showProducts"],
    showMedia: json["showMedia"] == null ? null : json["showMedia"],
    showForms: json["showForms"] == null ? null : json["showForms"],
    showCategories: json["showCategories"] == null ? null : json["showCategories"],
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
    "showProducts": showProducts == null ? null : showProducts,
    "showMedia": showMedia == null ? null : showMedia,
    "showForms": showForms == null ? null : showForms,
    "showCategories": showCategories == null ? null : showCategories,
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
    orderId: json["orderId"] == null ? null : json["orderId"],
    productId: json["productId"] == null ? null : json["productId"],
    price: json["price"] == null ? null : json["price"],
    count: json["count"] == null ? null : json["count"],
    id: json["id"] == null ? null : json["id"],
    product: json["product"] == null ? null : ProductReadDto.fromMap(json["user"]),
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toMap() => {
    "orderId": orderId == null ? null : orderId,
    "productId": productId == null ? null : productId,
    "price": price == null ? null : price,
    "count": count == null ? null : count,
    "id": id == null ? null : id,
    "product": product == null ? null : product!.toMap(),
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
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
    id: json["id"] == null ? null : json["id"],
    description: json["description"] == null ? null : json["description"],
    status: json["status"] == null ? null : json["status"],
    receivedDate: json["receivedDate"] == null ? null : json["receivedDate"],
    totalPrice: json["totalPrice"] == null ? null : json["totalPrice"],
    discountPercent: json["discountPercent"] == null ? null : json["discountPercent"],
    discountCode: json["discountCode"] == null ? null : json["discountCode"],
    discountPrice: json["discountPrice"] == null ? null : json["discountPrice"],
    sendPrice: json["sendPrice"] == null ? null : json["sendPrice"],
    payType: json["payType"] == null ? null : json["payType"],
    sendType: json["sendType"] == null ? null : json["sendType"],
    orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "description": description == null ? null : description,
    "status": status == null ? null : status,
    "receivedDate": receivedDate == null ? null : receivedDate,
    "totalPrice": totalPrice == null ? null : totalPrice,
    "discountPercent": discountPercent == null ? null : discountPercent,
    "discountCode": discountCode == null ? null : discountCode,
    "discountPrice": discountPrice == null ? null : discountPrice,
    "sendPrice": sendPrice == null ? null : sendPrice,
    "payType": payType == null ? null : payType,
    "sendType": sendType == null ? null : sendType,
    "orderDetails": orderDetails == null ? null : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
  };
}
