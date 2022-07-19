import 'package:utilities/utilities.dart';

class NotificationReadDto {
  NotificationReadDto({
    this.id,
    this.title,
    this.message,
    this.link,
    this.createdAt,
    this.visited,
    this.useCase,
    this.media,
  });

  final String? id;
  final String? title;
  final String? message;
  final String? link;
  final String? createdAt;
  final bool? visited;
  final String? useCase;
  final List<MediaReadDto>? media;

  factory NotificationReadDto.fromJson(String str) => NotificationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationReadDto.fromMap(Map<String, dynamic> json) => NotificationReadDto(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        message: json["message"] == null ? null : json["message"],
        link: json["link"] == null ? null : json["link"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        visited: json["visited"] == null ? null : json["visited"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "message": message == null ? null : message,
        "link": link == null ? null : link,
        "createdAt": createdAt == null ? null : createdAt,
        "visited": visited == null ? null : visited,
        "useCase": useCase == null ? null : useCase,
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}
