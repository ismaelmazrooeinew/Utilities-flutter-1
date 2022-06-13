import 'package:utilities/utilities.dart';

class ProductCreateUpdateDto {
  ProductCreateUpdateDto({
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
    this.details,
    this.author,
    this.phoneNumber,
    this.link,
    this.website,
    this.email,
    this.type,
    this.latitude,
    this.longitude,
    this.status,
    this.favorites,
    this.specialties,
    this.reports,
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
  final List<FormFieldDto>? forms;
  final String? details;
  final String? author;
  final String? phoneNumber;
  final String? link;
  final String? website;
  final String? email;
  final String? type;
  final int? latitude;
  final int? longitude;
  final int? status;
  final List<IdTitleReadDto>? favorites;
  final List<IdTitleReadDto>? specialties;
  final List<IdTitleReadDto>? reports;

  factory ProductCreateUpdateDto.fromJson(String str) => ProductCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCreateUpdateDto.fromMap(Map<String, dynamic> json) => ProductCreateUpdateDto(
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
        forms: json["forms"] == null ? null : List<FormFieldDto>.from(json["forms"].map((x) => FormFieldDto.fromMap(x))),
        details: json["details"] == null ? null : json["details"],
        author: json["author"] == null ? null : json["author"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        link: json["link"] == null ? null : json["link"],
        website: json["website"] == null ? null : json["website"],
        email: json["email"] == null ? null : json["email"],
        type: json["type"] == null ? null : json["type"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        status: json["status"] == null ? null : json["status"],
        favorites: json["favorites"] == null ? null : List<IdTitleReadDto>.from(json["favorites"].map((x) => x)),
        specialties: json["specialties"] == null ? null : List<IdTitleReadDto>.from(json["specialties"].map((x) => x)),
        reports: json["reports"] == null ? null : List<IdTitleReadDto>.from(json["reports"].map((x) => x)),
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
        "details": details == null ? null : details,
        "author": author == null ? null : author,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "link": link == null ? null : link,
        "website": website == null ? null : website,
        "email": email == null ? null : email,
        "type": type == null ? null : type,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "status": status == null ? null : status,
        "favorites": favorites == null ? null : List<dynamic>.from(favorites!.map((x) => x)),
        "specialties": specialties == null ? null : List<dynamic>.from(specialties!.map((x) => x)),
        "reports": reports == null ? null : List<dynamic>.from(reports!.map((x) => x)),
      };
}

class ProductReadDto {
  ProductReadDto({
    this.id,
    this.userId,
    this.title,
    this.subtitle,
    this.description,
    this.details,
    this.address,
    this.author,
    this.phoneNumber,
    this.link,
    this.website,
    this.email,
    this.type,
    this.isForSale,
    this.enabled,
    this.isBookmarked,
    this.latitude,
    this.longitude,
    this.visitsCount,
    this.price,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.status,
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
  final String? userId;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? details;
  final String? address;
  final String? author;
  final String? phoneNumber;
  final String? link;
  final String? website;
  final String? email;
  final String? type;
  final bool? isForSale;
  final bool? enabled;
  final bool? isBookmarked;
  final double? latitude;
  final double? longitude;
  final int? visitsCount;
  final double? price;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final UserReadDto? user;
  final int? status;
  final List<LocationReadDto>? locations;
  final List<MediaReadDto>? media;
  final List<IdTitleReadDto>? categories;
  final List<IdTitleReadDto>? brands;
  final List<IdTitleReadDto>? references;
  final List<IdTitleReadDto>? tags;
  final List<VoteField>? voteFields;
  final List<IdTitleReadDto>? specialities;
  final List<FormFieldDto>? forms;

  factory ProductReadDto.fromJson(String str) => ProductReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductReadDto.fromMap(Map<String, dynamic> json) => ProductReadDto(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        description: json["description"] == null ? null : json["description"],
        details: json["details"] == null ? null : json["details"],
        address: json["address"] == null ? null : json["address"],
        author: json["author"] == null ? null : json["author"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        link: json["link"] == null ? null : json["link"],
        website: json["website"] == null ? null : json["website"],
        email: json["email"] == null ? null : json["email"],
        type: json["type"] == null ? null : json["type"],
        isForSale: json["isForSale"] == null ? null : json["isForSale"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        isBookmarked: json["isBookmarked"] == null ? null : json["isBookmarked"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        visitsCount: json["visitsCount"] == null ? null : json["visitsCount"],
        price: json["price"] == null ? null : json["price"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        status: json["status"] == null ? null : json["status"],
        locations: json["locations"] == null ? null : List<LocationReadDto>.from(json["locations"].map((x) => LocationReadDto.fromMap(x))),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<IdTitleReadDto>.from(json["categories"].map((x) => IdTitleReadDto.fromMap(x))),
        brands: json["brands"] == null ? null : List<IdTitleReadDto>.from(json["brands"].map((x) => IdTitleReadDto.fromMap(x))),
        references: json["references"] == null ? null : List<IdTitleReadDto>.from(json["references"].map((x) => IdTitleReadDto.fromMap(x))),
        tags: json["tags"] == null ? null : List<IdTitleReadDto>.from(json["tags"].map((x) => IdTitleReadDto.fromMap(x))),
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
        specialities: json["specialities"] == null ? null : List<IdTitleReadDto>.from(json["specialities"].map((x) => IdTitleReadDto.fromMap(x))),
        forms: json["forms"] == null ? null : List<FormFieldDto>.from(json["forms"].map((x) => FormFieldDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "description": description == null ? null : description,
        "details": details == null ? null : details,
        "address": address == null ? null : address,
        "author": author == null ? null : author,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "link": link == null ? null : link,
        "website": website == null ? null : website,
        "email": email == null ? null : email,
        "type": type == null ? null : type,
        "isForSale": isForSale == null ? null : isForSale,
        "enabled": enabled == null ? null : enabled,
        "isBookmarked": isBookmarked == null ? null : isBookmarked,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "visitsCount": visitsCount == null ? null : visitsCount,
        "price": price == null ? null : price,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "user": user == null ? null : user!.toMap(),
        "status": status == null ? null : status,
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
