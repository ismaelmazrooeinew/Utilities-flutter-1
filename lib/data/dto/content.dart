import 'package:utilities/utilities.dart';

class ContentReadDto {
  ContentReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.subTitle,
    this.description,
    this.useCase,
    this.contactInformation,
    this.media,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? useCase;
  final List<ContactInformationReadDto>? contactInformation;
  final List<MediaReadDto>? media;

  factory ContentReadDto.fromJson(String str) => ContentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentReadDto.fromMap(Map<String, dynamic> json) => ContentReadDto(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
        title: json["title"] == null ? null : json["title"],
        subTitle: json["subTitle"] == null ? null : json["subTitle"],
        description: json["description"] == null ? null : json["description"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        contactInformation: json["contactInformation"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformation"].map((x) => ContactInformationReadDto.fromMap(x))),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "deletedAt": deletedAt == null ? null : deletedAt,
        "title": title == null ? null : title,
        "subTitle": subTitle == null ? null : subTitle,
        "description": description == null ? null : description,
        "useCase": useCase == null ? null : useCase,
        "contactInformation": contactInformation == null ? null : List<dynamic>.from(contactInformation!.map((x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}

class ContentCreateUpdateDto {
  ContentCreateUpdateDto({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.useCase,
    this.approvalStatus,
    this.contactInformations,
  });

  final String? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? useCase;
  final int? approvalStatus;
  final List<ContactInformationReadDto>? contactInformations;

  factory ContentCreateUpdateDto.fromJson(String str) => ContentCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentCreateUpdateDto.fromMap(Map<String, dynamic> json) => ContentCreateUpdateDto(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    subTitle: json["subTitle"] == null ? null : json["subTitle"],
    description: json["description"] == null ? null : json["description"],
    useCase: json["useCase"] == null ? null : json["useCase"],
    approvalStatus: json["approvalStatus"] == null ? null : json["approvalStatus"],
    contactInformations: json["contactInformations"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformations"].map((x) => ContactInformationReadDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "subTitle": subTitle == null ? null : subTitle,
    "description": description == null ? null : description,
    "useCase": useCase == null ? null : useCase,
    "approvalStatus": approvalStatus == null ? null : approvalStatus,
    "contactInformations": contactInformations == null ? null : List<dynamic>.from(contactInformations!.map((x) => x.toMap())),
  };
}