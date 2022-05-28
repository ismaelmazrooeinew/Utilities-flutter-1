import 'package:utilities/utilities.dart';

class IdTitleReadDto {
  IdTitleReadDto({
    required this.id,
    required this.secondaryId,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.link,
    required this.useCase,
    required this.parent,
    required this.parentId,
  });

  final int? secondaryId;
  final int? useCase;
  final String? id;
  final String? title;
  final String? subtitle;
  final String? color;
  final String? link;
  final String? parent;
  final String? parentId;

  factory IdTitleReadDto.fromJson(String str) => IdTitleReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdTitleReadDto.fromMap(Map<String, dynamic> json) => IdTitleReadDto(
        id: json["id"] == null ? null : json["id"],
        secondaryId: json["secondaryId"] == null ? null : json["secondaryId"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        color: json["color"] == null ? null : json["color"],
        link: json["link"] == null ? null : json["link"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        parent: json["parent"] == null ? null : json["parent"],
        parentId: json["parentId"] == null ? null : json["parentId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "secondaryId": secondaryId == null ? null : secondaryId,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "color": color == null ? null : color,
        "link": link == null ? null : link,
        "useCase": useCase == null ? null : useCase,
        "parent": parent == null ? null : parent,
        "parentId": parentId == null ? null : parentId,
      };
}

class IdTitleCreateUpdateDto {
  IdTitleCreateUpdateDto({
    required this.id,
    required this.secondaryId,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.link,
    required this.useCase,
  });

  final int? secondaryId;
  final int? useCase;
  final String? id;
  final String? title;
  final String? subtitle;
  final String? color;
  final String? link;

  factory IdTitleCreateUpdateDto.fromJson(String str) => IdTitleCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdTitleCreateUpdateDto.fromMap(Map<String, dynamic> json) => IdTitleCreateUpdateDto(
        id: json["id"] == null ? null : json["id"],
        secondaryId: json["secondaryId"] == null ? null : json["secondaryId"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        color: json["color"] == null ? null : json["color"],
        link: json["link"] == null ? null : json["link"],
        useCase: json["useCase"] == null ? null : json["useCase"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "secondaryId": secondaryId == null ? null : secondaryId,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "color": color == null ? null : color,
        "link": link == null ? null : link,
        "useCase": useCase == null ? null : useCase,
      };
}

extension NullableIdTitleResponseExtension on List<IdTitleReadDto>? {
  List<String> getTitles() => this?.map((final IdTitleReadDto e) => e.title ?? "--").toList() ?? <String>[];
}

extension IdTitleResponseExtension on List<IdTitleReadDto> {
  List<String> getTitles() => map((final IdTitleReadDto e) => e.title ?? "--").toList();
}
