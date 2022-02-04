import 'package:utilities/utilities.dart';

class UtilitiesLocationResponse {
  UtilitiesLocationResponse({
    required this.id,
    required this.parentId,
    required this.parent,
    required this.title,
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  factory UtilitiesLocationResponse.fromJson(final String str) => UtilitiesLocationResponse.fromMap(json.decode(str));

  factory UtilitiesLocationResponse.fromMap(final Map<String, dynamic> json) => UtilitiesLocationResponse(
        id: json["i"],
        parentId: json["pi"],
        parent: json["p"] == null ? null : UtilitiesLocationResponse.fromMap(json["p"]),
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
  final UtilitiesLocationResponse? parent;

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
