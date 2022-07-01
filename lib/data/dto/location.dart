import 'package:utilities/utilities.dart';

class LocationReadDto {
  LocationReadDto({
    this.id,
    this.title,
    this.parentId,
    this.parent,
    this.latitude,
    this.longitude,
    this.type,
  });

  final int? id;
  final String? title;
  final int? parentId;
  final LocationReadDto? parent;
  final double? latitude;
  final double? longitude;
  final String? type;

  factory LocationReadDto.fromJson(String str) => LocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationReadDto.fromMap(dynamic json) => LocationReadDto(
    id: json["i"],
    title: json["n"],
    parentId: json["pi"],
    parent: json["p"] == null ? null :  LocationReadDto.fromMap(json["p"]),
    latitude: json["lat"],
    longitude: json["lon"],
    type: json["t"],
  );

  Map<String, dynamic> toMap() => {
    "i": id,
    "n": title,
    "pi": parentId,
    "p": parent == null ? null :parent!.toMap(),
    "lat": latitude,
    "lon": longitude,
    "t": type,
  };
}
