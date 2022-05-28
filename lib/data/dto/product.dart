import 'package:utilities/utilities.dart';

class ProductReadDto {
  ProductReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.subtitle,
    this.description,
    this.enabled,
    this.isForSale,
    this.isBookmarked,
    this.price,
    this.visitsCount,
    this.address,
    this.startDate,
    this.endDate,
    this.user,
    this.locations,
    this.media,
    this.categories,
    this.brands,
    this.references,
    this.tags,
    this.voteFields,
    this.specialities,
    this.forms,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? address;
  final String? startDate;
  final String? endDate;
  final bool? enabled;
  final bool? isForSale;
  final bool? isBookmarked;
  final int? price;
  final int? visitsCount;
  final UserReadDto? user;
  final List<LocationReadDto>? locations;
  final List<MediaReadDto>? media;
  final List<IdTitleReadDto>? categories;
  final List<IdTitleReadDto>? brands;
  final List<IdTitleReadDto>? references;
  final List<IdTitleReadDto>? tags;
  final List<VoteField>? voteFields;
  final List<IdTitleReadDto>? specialities;
  final List<FormReadDto>? forms;

  factory ProductReadDto.fromJson(String str) => ProductReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductReadDto.fromMap(Map<String, dynamic> json) => ProductReadDto(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        description: json["description"] == null ? null : json["description"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        isForSale: json["isForSale"] == null ? null : json["isForSale"],
        isBookmarked: json["isBookmarked"] == null ? null : json["isBookmarked"],
        price: json["price"] == null ? null : json["price"],
        visitsCount: json["visitsCount"] == null ? null : json["visitsCount"],
        address: json["address"] == null ? null : json["address"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        locations: json["locations"] == null ? null : List<LocationReadDto>.from(json["locations"].map((x) => LocationReadDto.fromMap(x))),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<IdTitleReadDto>.from(json["categories"].map((x) => IdTitleReadDto.fromMap(x))),
        brands: json["brands"] == null ? null : List<IdTitleReadDto>.from(json["brands"].map((x) => IdTitleReadDto.fromMap(x))),
        references: json["references"] == null ? null : List<IdTitleReadDto>.from(json["references"].map((x) => IdTitleReadDto.fromMap(x))),
        tags: json["tags"] == null ? null : List<IdTitleReadDto>.from(json["tags"].map((x) => IdTitleReadDto.fromMap(x))),
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
        specialities: json["specialities"] == null ? null : List<IdTitleReadDto>.from(json["specialities"].map((x) => IdTitleReadDto.fromMap(x))),
        forms: json["forms"] == null ? null : List<FormReadDto>.from(json["forms"].map((x) => FormReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "description": description == null ? null : description,
        "enabled": enabled == null ? null : enabled,
        "isForSale": isForSale == null ? null : isForSale,
        "isBookmarked": isBookmarked == null ? null : isBookmarked,
        "price": price == null ? null : price,
        "visitsCount": visitsCount == null ? null : visitsCount,
        "address": address == null ? null : address,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
        "user": user == null ? null : user!.toMap(),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "brands": brands == null ? null : List<dynamic>.from(brands!.map((x) => x.toMap())),
        "references": references == null ? null : List<dynamic>.from(references!.map((x) => x.toMap())),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toMap())),
        "voteFields": voteFields == null ? null : List<dynamic>.from(voteFields!.map((x) => x.toMap())),
        "specialities": specialities == null ? null : List<dynamic>.from(specialities!.map((x) => x.toMap())),
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((x) => x.toMap())),
      };
}

class ProductCreateUpdateDto {
  ProductCreateUpdateDto({
     this.id,
     this.title,
     this.subtitle,
     this.description,
     this.subTitle,
     this.price,
     this.isForSale,
     this.enabled,
     this.visitsCount,
     this.address,
     this.startDate,
     this.endDate,
     this.locations,
     this.categories,
     this.references,
     this.brands,
     this.specialties,
     this.tags,
  });

  final String? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? subTitle;
  final String? address;
  final String? startDate;
  final String? endDate;
  final int? price;
  final bool? isForSale;
  final bool? enabled;
  final int? visitsCount;
  final List<int>? locations;
  final List<String>? categories;
  final List<String>? references;
  final List<String>? brands;
  final List<String>? specialties;
  final List<String>? tags;

  factory ProductCreateUpdateDto.fromJson(String str) => ProductCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCreateUpdateDto.fromMap(Map<String, dynamic> json) => ProductCreateUpdateDto(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        description: json["description"] == null ? null : json["description"],
        subTitle: json["subTitle"] == null ? null : json["subTitle"],
        price: json["price"] == null ? null : json["price"],
        isForSale: json["isForSale"] == null ? null : json["isForSale"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        visitsCount: json["visitsCount"] == null ? null : json["visitsCount"],
        address: json["address"] == null ? null : json["address"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        locations: json["locations"] == null ? null : List<int>.from(json["locations"].map((x) => x)),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
        references: json["references"] == null ? null : List<String>.from(json["references"].map((x) => x)),
        brands: json["brands"] == null ? null : List<String>.from(json["brands"].map((x) => x)),
        specialties: json["specialties"] == null ? null : List<String>.from(json["specialties"].map((x) => x)),
        tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "description": description == null ? null : description,
        "subTitle": subTitle == null ? null : subTitle,
        "price": price == null ? null : price,
        "isForSale": isForSale == null ? null : isForSale,
        "enabled": enabled == null ? null : enabled,
        "visitsCount": visitsCount == null ? null : visitsCount,
        "address": address == null ? null : address,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x)),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
        "references": references == null ? null : List<dynamic>.from(references!.map((x) => x)),
        "brands": brands == null ? null : List<dynamic>.from(brands!.map((x) => x)),
        "specialties": specialties == null ? null : List<dynamic>.from(specialties!.map((x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
      };
}
