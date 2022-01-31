import 'package:utilities/utilities.dart';

class UtilitiesLocationResponse {
  UtilitiesLocationResponse({
    required this.id,
    required this.parentId,
    required this.parent,
    required this.title,
    required this.type,
  });

  factory UtilitiesLocationResponse.fromJson(final String str) => UtilitiesLocationResponse.fromMap(json.decode(str));

  factory UtilitiesLocationResponse.fromMap(final Map<String, dynamic> json) => UtilitiesLocationResponse(
        id: json["I"],
        parentId: json["PI"],
        parent: json["P"] == null ? null : UtilitiesLocationResponse.fromMap(json["P"]),
        title: json["N"],
        type: json["T"],
      );

  final int? id;
  final int? parentId;
  final int? type;
  final String? title;
  final UtilitiesLocationResponse? parent;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "I": id,
        "PI": parentId,
        "P": parent ?? parent?.toMap(),
        "N": title,
        "T": type,
      };
}
