import 'package:utilities/utilities.dart';

class BookmarkReadDto {
  BookmarkReadDto({
    this.product,
    this.folderName,
    this.media,
    this.id,
  });

  final ProductReadDto? product;
  final MediaReadDto? media;
  final String? folderName;
  final String? id;

  factory BookmarkReadDto.fromJson(String str) => BookmarkReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookmarkReadDto.fromMap(Map<String, dynamic> json) => BookmarkReadDto(
        folderName: json["folderName"],
        id: json["id"],
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
        media: json["media"] == null ? null : MediaReadDto.fromMap(json["media"]),
      );

  Map<String, dynamic> toMap() => {
        "folderName": folderName,
        "id": id,
        "product": product == null ? null : product!.toMap(),
        "media": media == null ? null : media!.toMap(),
      };
}

class ToggleBookmark {
  ToggleBookmark({
    this.productId,
    this.categoryId,
    this.folderName,
  });

  final String? productId;
  final String? categoryId;
  final String? folderName;

  factory ToggleBookmark.fromJson(String str) => ToggleBookmark.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ToggleBookmark.fromMap(Map<String, dynamic> json) => ToggleBookmark(
        productId: json["productId"],
        categoryId: json["categoryId"],
        folderName: json["folderName"],
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "categoryId": categoryId,
        "folderName": folderName,
      };
}

class ToggleFollow {
  ToggleFollow({
    this.userId,
  });

  final String? userId;

  factory ToggleFollow.fromJson(String str) => ToggleFollow.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ToggleFollow.fromMap(Map<String, dynamic> json) => ToggleFollow(
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
      };
}
