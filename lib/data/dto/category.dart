import 'package:utilities/utilities.dart';

class CategoryCreateUpdateDto {
  CategoryCreateUpdateDto({
    this.id,
    this.parentId,
    this.title,
    this.titleTr1,
    this.subtitle,
    this.link,
    this.color,
    this.useCase,
    this.type,
  });

  final String? id;
  final String? parentId;
  final String? title;
  final String? titleTr1;
  final String? subtitle;
  final String? link;
  final String? color;
  final String? useCase;
  final String? type;

  factory CategoryCreateUpdateDto.fromJson(String str) => CategoryCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryCreateUpdateDto.fromMap(Map<String, dynamic> json) => CategoryCreateUpdateDto(
        id: json["id"] == null ? null : json["id"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        title: json["title"] == null ? null : json["title"],
        titleTr1: json["titleTr1"] == null ? null : json["titleTr1"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        link: json["link"] == null ? null : json["link"],
        color: json["color"] == null ? null : json["color"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        type: json["type"] == null ? null : json["type"],
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
        "type": type == null ? null : type,
      };
}

class CategoryReadDto {
  CategoryReadDto({
    this.id,
    this.title,
    this.titleTr1,
    this.subtitle,
    this.color,
    this.link,
    this.useCase,
    this.type,
    this.parent,
    this.children,
    this.parentId,
    this.media,
  });

  final String? id;
  final String? title;
  final String? titleTr1;
  final String? subtitle;
  final String? color;
  final String? link;
  final String? useCase;
  final String? type;
  final CategoryReadDto? parent;
  final List<CategoryReadDto>? children;
  final String? parentId;
  final List<MediaReadDto>? media;

  factory CategoryReadDto.fromJson(String str) => CategoryReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryReadDto.fromMap(Map<String, dynamic> json) => CategoryReadDto(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        titleTr1: json["titleTr1"] == null ? null : json["titleTr1"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        color: json["color"] == null ? null : json["color"],
        link: json["link"] == null ? null : json["link"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        type: json["type"] == null ? null : json["type"],
        parent: json["parent"] == null ? null : CategoryReadDto.fromMap(json["parent"]),
        children: json["children"] == null ? null : List<CategoryReadDto>.from(json["children"].map((x) => x)),
        parentId: json["parentId"] == null ? null : json["parentId"],
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "titleTr1": titleTr1 == null ? null : titleTr1,
        "subtitle": subtitle == null ? null : subtitle,
        "color": color == null ? null : color,
        "link": link == null ? null : link,
        "useCase": useCase == null ? null : useCase,
        "type": type == null ? null : type,
        "parent": parent == null ? null : parent!.toMap(),
        "children": children == null ? null : List<dynamic>.from(children!.map((x) => x)),
        "parentId": parentId == null ? null : parentId,
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}
