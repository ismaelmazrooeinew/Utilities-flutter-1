import 'package:utilities/utilities.dart';

class NotificationReadDto {
  NotificationReadDto({
    this.id,
    this.title,
    this.message,
    this.createdAt,
    this.visited,
    this.link,
    this.seenStatus,
    this.useCase,
    this.creatorUser,
    this.media,
  });

  final String? id;
  final String? title;
  final String? message;
  final String? createdAt;
  final bool? visited;
  final String? link;
  final String? useCase;
  final int? seenStatus;
  final UserReadDto? creatorUser;
  final List<MediaReadDto>? media;

  factory NotificationReadDto.fromJson(String str) => NotificationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationReadDto.fromMap(Map<String, dynamic> json) => NotificationReadDto(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        message: json["message"] == null ? null : json["message"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        visited: json["visited"] == null ? null : json["visited"],
        link: json["link"] == null ? null : json["link"],
        seenStatus: json["seenStatus"] == null ? null : json["seenStatus"],
        useCase: json["useCase"] == null ? null : json["useCase"],
        creatorUser: json["creatorUser"] == null ? null : UserReadDto.fromMap(json["creatorUser"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "message": message == null ? null : message,
        "createdAt": createdAt == null ? null : createdAt,
        "visited": visited == null ? null : visited,
        "link": link == null ? null : link,
        "seenStatus": seenStatus == null ? null : seenStatus,
        "useCase": useCase == null ? null : useCase,
        "creatorUser": creatorUser == null ? null : creatorUser!.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}
