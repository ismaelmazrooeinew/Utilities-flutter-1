import 'package:utilities/utilities.dart';

class GlobalSearchCreateDto {
  GlobalSearchCreateDto({
    this.user,
    this.product,
    this.title,
    this.categories,
    this.category,
    this.pageNumber,
    this.isBookmark,
    this.isMine,
    this.newest,
    this.oldest,
    this.pageSize,
    this.reputation,
  });

  final String? title;
  final List<String>? categories;
  final int? pageSize;
  final int? pageNumber;
  final bool? newest;
  final bool? oldest;
  final bool? reputation;
  final bool? user;
  final bool? product;
  final bool? category;
  final bool? isBookmark;
  final bool? isMine;

  factory GlobalSearchCreateDto.fromJson(String str) => GlobalSearchCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GlobalSearchCreateDto.fromMap(Map<String, dynamic> json) => GlobalSearchCreateDto(
        title: json["title"] == null ? null : json["title"],
        categories: json["categories"] == null ? null : json["categories"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        pageNumber: json["pageNumber"] == null ? null : json["pageNumber"],
        newest: json["newest"] == null ? null : json["newest"],
        oldest: json["oldest"] == null ? null : json["oldest"],
        reputation: json["reputation"] == null ? null : json["reputation"],
        user: json["user"] == null ? null : json["user"],
        product: json["product"] == null ? null : json["product"],
        category: json["category"] == null ? null : json["category"],
        isBookmark: json["isBookmark"] == null ? null : json["isBookmark"],
        isMine: json["isMine"] == null ? null : json["isMine"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "categories": categories == null ? null : categories,
        "pageSize": pageSize == null ? null : pageSize,
        "pageNumber": pageNumber == null ? null : pageNumber,
        "newest": newest == null ? null : newest,
        "oldest": oldest == null ? null : oldest,
        "reputation": reputation == null ? null : reputation,
        "user": user == null ? null : user,
        "product": product == null ? null : product,
        "category": category == null ? null : category,
        "isBookmark": isBookmark == null ? null : isBookmark,
        "isMine": isMine == null ? null : isMine,
      };
}

class GlobalSearchReadDto {
  GlobalSearchReadDto({this.categories, this.products, this.users});

  final List<UserReadDto>? users;
  final List<ProductReadDto>? products;
  final List<CategoryReadDto>? categories;

  factory GlobalSearchReadDto.fromJson(String str) => GlobalSearchReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GlobalSearchReadDto.fromMap(Map<String, dynamic> json) => GlobalSearchReadDto(
    users: json["users"] == null ? null : List<UserReadDto>.from(json["users"].map((x) => UserReadDto.fromMap(x))),
    products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].map((x) => ProductReadDto.fromMap(x))),
    categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),

  );

  Map<String, dynamic> toMap() => {
    "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toMap())),
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toMap())),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
  };
}
