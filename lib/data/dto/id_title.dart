import 'package:utilities/utilities.dart';

class IdTitleReadDto {
  IdTitleReadDto({
    this.id,
    this.secondaryId,
    this.title,
    this.titleTr1,
    this.subtitle,
    this.color,
    this.link,
    this.useCase,
    this.parent,
    this.parentId,
    this.media,
  });

  final String? id;
  final int? secondaryId;
  final String? title;
  final String? titleTr1;
  final String? subtitle;
  final String? color;
  final String? link;
  final int? useCase;
  final String? parent;
  final String? parentId;
  final List<MediaReadDto>? media;

  factory IdTitleReadDto.fromJson(String str) => IdTitleReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdTitleReadDto.fromMap(Map<String, dynamic> json) => IdTitleReadDto(
    id: json["id"] == null ? null : json["id"],
    secondaryId: json["secondaryId"] == null ? null : json["secondaryId"],
    title: json["title"] == null ? null : json["title"],
    titleTr1: json["titleTr1"] == null ? null : json["titleTr1"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    color: json["color"] == null ? null : json["color"],
    link: json["link"] == null ? null : json["link"],
    useCase: json["useCase"] == null ? null : json["useCase"],
    parent: json["parent"] == null ? null : json["parent"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "secondaryId": secondaryId == null ? null : secondaryId,
    "title": title == null ? null : title,
    "titleTr1": titleTr1 == null ? null : titleTr1,
    "subtitle": subtitle == null ? null : subtitle,
    "color": color == null ? null : color,
    "link": link == null ? null : link,
    "useCase": useCase == null ? null : useCase,
    "parent": parent == null ? null : parent,
    "parentId": parentId == null ? null : parentId,
    "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
  };
}

class IdTitleCreateUpdateDto {
  IdTitleCreateUpdateDto({
    this.id,
    this.parentId,
    this.title,
    this.titleTr1,
    this.subtitle,
    this.link,
    this.color,
    this.useCase,
  });

  final String? id;
  final String? parentId;
  final String? title;
  final String? titleTr1;
  final String? subtitle;
  final String? link;
  final String? color;
  final int? useCase;

  factory IdTitleCreateUpdateDto.fromJson(String str) => IdTitleCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdTitleCreateUpdateDto.fromMap(Map<String, dynamic> json) => IdTitleCreateUpdateDto(
    id: json["id"] == null ? null : json["id"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    title: json["title"] == null ? null : json["title"],
    titleTr1: json["titleTr1"] == null ? null : json["titleTr1"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    link: json["link"] == null ? null : json["link"],
    color: json["color"] == null ? null : json["color"],
    useCase: json["useCase"] == null ? null : json["useCase"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "parentId": parentId == null ? null : parentId,
    "title": title == null ? null : title,
    "titleTr1": titleTr1 == null ? null : titleTr1,
    "subtitle": subtitle == null ? null : subtitle,
    "link": link == null ? null : link,
    "color": color == null ? null : color,
    "useCase": useCase == null ? null : useCase,
  };
}

extension NullableIdTitleResponseExtension on List<IdTitleReadDto>? {
  List<String> getTitles() => this?.map((final IdTitleReadDto e) => e.title ?? "--").toList() ?? <String>[];
}

extension IdTitleResponseExtension on List<IdTitleReadDto> {
  List<String> getTitles() => map((final IdTitleReadDto e) => e.title ?? "--").toList();
}
