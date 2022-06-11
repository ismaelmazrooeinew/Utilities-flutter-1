import 'package:utilities/utilities.dart';

class ShoppingCartReadDto {
  ShoppingCartReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.shoppingCartItems,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? userId;
  final List<ShoppingCartItem>? shoppingCartItems;

  factory ShoppingCartReadDto.fromJson(String str) => ShoppingCartReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppingCartReadDto.fromMap(Map<String, dynamic> json) => ShoppingCartReadDto(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        userId: json["userId"] == null ? null : json["userId"],
        shoppingCartItems: json["shoppingCartItems"] == null ? null : List<ShoppingCartItem>.from(json["shoppingCartItems"].map((x) => ShoppingCartItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "userId": userId == null ? null : userId,
        "shoppingCartItems": shoppingCartItems == null ? null : List<dynamic>.from(shoppingCartItems!.map((x) => x.toMap())),
      };
}

class ShoppingCartItem {
  ShoppingCartItem({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.quantity,
    this.shoppingCartId,
    this.productId,
    this.projectId,
    this.dailyPriceId,
    this.tutorialId,
    this.eventId,
    this.adId,
    this.companyId,
    this.tenderId,
    this.serviceId,
    this.magazineId,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? quantity;
  final String? shoppingCartId;
  final String? productId;
  final String? projectId;
  final String? dailyPriceId;
  final String? tutorialId;
  final String? eventId;
  final String? adId;
  final String? companyId;
  final String? tenderId;
  final String? serviceId;
  final String? magazineId;

  factory ShoppingCartItem.fromJson(String str) => ShoppingCartItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppingCartItem.fromMap(Map<String, dynamic> json) => ShoppingCartItem(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        shoppingCartId: json["shoppingCartId"] == null ? null : json["shoppingCartId"],
        productId: json["productId"] == null ? null : json["productId"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        dailyPriceId: json["dailyPriceId"] == null ? null : json["dailyPriceId"],
        tutorialId: json["tutorialId"] == null ? null : json["tutorialId"],
        eventId: json["eventId"] == null ? null : json["eventId"],
        adId: json["adId"] == null ? null : json["adId"],
        companyId: json["companyId"] == null ? null : json["companyId"],
        tenderId: json["tenderId"] == null ? null : json["tenderId"],
        serviceId: json["serviceId"] == null ? null : json["serviceId"],
        magazineId: json["magazineId"] == null ? null : json["magazineId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "quantity": quantity == null ? null : quantity,
        "shoppingCartId": shoppingCartId == null ? null : shoppingCartId,
        "productId": productId == null ? null : productId,
        "projectId": projectId == null ? null : projectId,
        "dailyPriceId": dailyPriceId == null ? null : dailyPriceId,
        "tutorialId": tutorialId == null ? null : tutorialId,
        "eventId": eventId == null ? null : eventId,
        "adId": adId == null ? null : adId,
        "companyId": companyId == null ? null : companyId,
        "tenderId": tenderId == null ? null : tenderId,
        "serviceId": serviceId == null ? null : serviceId,
        "magazineId": magazineId == null ? null : magazineId,
      };
}
