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
    this.children,
  });

  final num? id;
  final String? title;
  final int? parentId;
  final LocationReadDto? parent;
  final List<LocationReadDto>? children;
  final num? latitude;
  final num? longitude;
  final int? type;

  factory LocationReadDto.fromJson(String str) => LocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationReadDto.fromMap(dynamic json) => LocationReadDto(
        id: json["i"],
        title: json["n"],
        parentId: json["pi"],
        parent: json["p"] == null ? null : LocationReadDto.fromMap(json["p"]),
        latitude: json["lat"],
        longitude: json["lon"],
        type: json["t"],
        children: json["ch"] == null ? null : List<LocationReadDto>.from(json["ch"].map((x) => LocationReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "i": id,
        "n": title,
        "pi": parentId,
        "p": parent == null ? null : parent!.toMap(),
        "lat": latitude,
        "lon": longitude,
        "t": type,
        "ch": children == null ? null : List<dynamic>.from(children!.map((x) => x.toMap())),
      };
}

class IranLocationReadDto {
  IranLocationReadDto({
    this.id,
    this.name,
    this.slug,
    this.provinceId,
  });

  final int? id;
  final String? name;
  final String? slug;
  final int? provinceId;

  factory IranLocationReadDto.fromJson(String str) => IranLocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IranLocationReadDto.fromMap(dynamic json) => IranLocationReadDto(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    provinceId: json["province_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "province_id": provinceId,
      };
}
