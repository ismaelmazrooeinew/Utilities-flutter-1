import 'package:utilities/utilities.dart';

class DiscountReadDto {
  DiscountReadDto({
    this.title,
    this.discountPercent,
    this.numberUses,
    this.code,
    this.startDate,
    this.endDate,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) {
    // TODO: implement Result
    throw UnimplementedError();
  }

  final String? title;
  final int? discountPercent;
  final int? numberUses;
  final String? code;
  final String? startDate;
  final String? endDate;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  factory DiscountReadDto.fromJson(String str) => DiscountReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DiscountReadDto.fromMap(Map<String, dynamic> json) => DiscountReadDto(
        title: json["title"] == null ? null : json["title"],
        discountPercent: json["discountPercent"] == null ? null : json["discountPercent"],
        numberUses: json["numberUses"] == null ? null : json["numberUses"],
        code: json["code"] == null ? null : json["code"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "discountPercent": discountPercent == null ? null : discountPercent,
        "numberUses": numberUses == null ? null : numberUses,
        "code": code == null ? null : code,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
      };
}

class DiscountFilterDto {
  DiscountFilterDto({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.discountPercent,
    this.numberUses,
    this.code,
    this.startDate,
    this.endDate,
  });

  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? title;
  final int? discountPercent;
  final int? numberUses;
  final String? code;
  final String? startDate;
  final String? endDate;

  factory DiscountFilterDto.fromJson(String str) => DiscountFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DiscountFilterDto.fromMap(Map<String, dynamic> json) => DiscountFilterDto(
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        title: json["title"] == null ? null : json["title"],
        discountPercent: json["discountPercent"] == null ? null : json["discountPercent"],
        numberUses: json["numberUses"] == null ? null : json["numberUses"],
        code: json["code"] == null ? null : json["code"],
        startDate: json["startDate"] == null ? null : json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "title": title == null ? null : title,
        "discountPercent": discountPercent == null ? null : discountPercent,
        "numberUses": numberUses == null ? null : numberUses,
        "code": code == null ? null : code,
        "startDate": startDate == null ? null : startDate,
        "endDate": endDate == null ? null : endDate,
      };
}
