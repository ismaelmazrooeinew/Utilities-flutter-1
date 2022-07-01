import 'package:utilities/utilities.dart';

class ServerLocationReadDto {
  ServerLocationReadDto({
    this.i,
    this.t,
    this.lat,
    this.lon,
    this.ch,
  });

  final int? i;
  final String? t;
  final double? lat;
  final double? lon;
  final List<ServerLocationReadDto>? ch;

  factory ServerLocationReadDto.fromJson(String str) => ServerLocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServerLocationReadDto.fromMap(Map<String, dynamic> json) => ServerLocationReadDto(
        i: json["i"] == null ? null : json["i"],
        t: json["t"] == null ? null : json["t"],
        lat: json["lat"] == null ? null : json["lat"],
        lon: json["lon"] == null ? null : json["lon"],
        ch: json["ch"] == null ? null : List<ServerLocationReadDto>.from(json["ch"].map((x) => ServerLocationReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "i": i == null ? null : i,
        "t": t == null ? null : t,
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "ch": ch == null ? null : List<dynamic>.from(ch!.map((x) => x.toMap())),
      };
}
