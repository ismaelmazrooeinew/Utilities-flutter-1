import 'package:utilities/utilities.dart';

class ServerLocationReadDto {
  ServerLocationReadDto({
    this.i,
    this.n,
    this.p,
    this.lat,
    this.lon,
    this.ch,
    this.pi,
  });

  final int? i;
  final int? pi;
  final String? n;
  final String? p;
  final double? lat;
  final double? lon;
  final List<String>? ch;

  factory ServerLocationReadDto.fromJson(String str) => ServerLocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServerLocationReadDto.fromMap(Map<String, dynamic> json) => ServerLocationReadDto(
        i: json["i"] == null ? null : json["i"],
        n: json["n"] == null ? null : json["n"],
        p: json["p"] == null ? null : json["p"],
        pi: json["pi"] == null ? null : json["pi"],
        lat: json["lat"] == null ? null : json["lat"],
        lon: json["lon"] == null ? null : json["lon"],
        ch: json["ch"] == null ? null : json["ch"],
      );

  Map<String, dynamic> toMap() => {
        "i": i == null ? null : i,
        "n": n == null ? null : n,
        "p": p == null ? null : p,
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "pi": pi == null ? null : pi,
        "ch": ch == null ? null : ch,
      };
}
