import 'package:utilities/utilities.dart';

class VoteField {
  VoteField({
     this.title,
     this.point,
  });

  final String? title;
  final int? point;

  factory VoteField.fromJson(String str) => VoteField.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteField.fromMap(Map<String, dynamic> json) => VoteField(
        title: json["title"] == null ? null : json["title"],
        point: json["point"] == null ? null : json["point"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "point": point == null ? null : point,
      };
}
