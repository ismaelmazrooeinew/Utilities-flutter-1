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
  final LocationReadDto? parent;
  final double? latitude;
  final double? longitude;
  final List<MediaReadDto>? media;
  final int? type;

  factory LocationReadDto.fromJson(String str) => LocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationReadDto.fromMap(Map<String, dynamic> json) => LocationReadDto(
    id: json["i"] == null ? null : json["i"],
    title: json["n"] == null ? null : json["n"],
    parentId: json["pi"] == null ? null : json["pi"],
    parent: json["p"] == null ? null :  LocationReadDto.fromMap(json["p"]),
    latitude: json["lat"] == null ? null : json["lat"],
    longitude: json["lon"] == null ? null : json["lon"],
    media: json["m"] == null ? null : List<MediaReadDto>.from(json["m"].map((x) => MediaReadDto.fromMap(x))),
    type: json["t"] == null ? null : json["t"],
  );

  Map<String, dynamic> toMap() => {
    "i": id == null ? null : id,
    "n": title == null ? null : title,
    "pi": parentId == null ? null : parentId,
    "p": parent == null ? null :parent!.toMap(),
    "lat": latitude == null ? null : latitude,
    "lon": longitude == null ? null : longitude,
    "m": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
    "t": type == null ? null : type,
  };
}
