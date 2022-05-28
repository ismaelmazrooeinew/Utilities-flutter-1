import 'package:utilities/utilities.dart';

class LocationReadDto {
  LocationReadDto({
    required this.id,
    required this.parentId,
    required this.parent,
    required this.title,
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  factory LocationReadDto.fromJson(final String str) => LocationReadDto.fromMap(json.decode(str));

  factory LocationReadDto.fromMap(final Map<String, dynamic> json) => LocationReadDto(
        id: json["i"],
        parentId: json["pi"],
        parent: json["p"] == null ? null : LocationReadDto.fromMap(json["p"]),
        title: json["n"],
        type: json["t"],
        latitude: json["lat"],
        longitude: json["lon"],
      );

  final int? id;
  final int? parentId;
  final int? type;
  final double? latitude;
  final double? longitude;
  final String? title;
  final LocationReadDto? parent;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "i": id,
        "pi": parentId,
        "p": parent ?? parent?.toMap(),
        "n": title,
        "t": type,
        "lat": latitude,
        "lon": longitude,
      };
}
