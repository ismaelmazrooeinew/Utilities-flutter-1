import 'package:utilities/utilities.dart';

class LocationReadDto {
  LocationReadDto({
    this.i,
    this.n,
    this.t,
    this.pi,
    this.p,
    this.lat,
    this.lon,
  });

  final int? i;
  final String? n;
  final int? t;
  final int? pi;
  final LocationReadDto? p;
  final double? lat;
  final double? lon;

  factory LocationReadDto.fromJson(String str) => LocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationReadDto.fromMap(Map<String, dynamic> json) => LocationReadDto(
    i: json["i"] == null ? null : json["i"],
    n: json["n"] == null ? null : json["n"],
    t: json["t"] == null ? null : json["t"],
    pi: json["pi"] == null ? null : json["pi"],
    p: json["p"] == null ? null : LocationReadDto.fromMap(json["p"]),
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "i": i == null ? null : i,
    "n": n == null ? null : n,
    "t": t == null ? null : t,
    "pi": pi == null ? null : pi,
    "p": p == null ? null : p!.toMap(),
    "lat": lat == null ? null : lat,
    "lon": lon == null ? null : lon,
  };
}
