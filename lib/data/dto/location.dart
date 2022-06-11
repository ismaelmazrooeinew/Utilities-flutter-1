import 'package:utilities/utilities.dart';

class LocationReadDto {
  LocationReadDto({
    this.id,
    this.title,
    this.parentId,
    this.parent,
    this.latitude,
    this.longitude,
    this.media,
    this.type,
  });

  final int? id;
  final String? title;
  final int? parentId;
  final String? parent;
  final int? latitude;
  final int? longitude;
  final List<MediaReadDto>? media;
  final int? type;

  factory LocationReadDto.fromJson(String str) => LocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationReadDto.fromMap(Map<String, dynamic> json) => LocationReadDto(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    parent: json["parent"] == null ? null : json["parent"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "parentId": parentId == null ? null : parentId,
    "parent": parent == null ? null : parent,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
    "type": type == null ? null : type,
  };
}
