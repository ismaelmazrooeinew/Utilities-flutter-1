import 'package:utilities/utilities.dart';

class VoteField {
  VoteField({
     this.id,
     this.title,
     this.point,
  });

  final String? id;
  final String? title;
  final double? point;

  factory VoteField.fromJson(String str) => VoteField.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteField.fromMap(Map<String, dynamic> json) => VoteField(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        point: json["point"] == null ? null : json["point"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "point": point == null ? null : point,
      };
}
