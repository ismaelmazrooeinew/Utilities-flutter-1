import 'package:utilities/utilities.dart';

class FormReadDto {
  FormReadDto({
    required this.id,
    required this.label,
    required this.title,
    required this.isRequired,
    required this.optionList,
    required this.type,
    required this.categoryId,
  });

  final String? id;
  final String? label;
  final String? title;
  final String? optionList;
  final String? categoryId;
  final bool? isRequired;
  final int? type;

  factory FormReadDto.fromJson(String str) => FormReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormReadDto.fromMap(Map<String, dynamic> json) => FormReadDto(
        id: json["id"] == null ? null : json["id"],
        label: json["label"] == null ? null : json["label"],
        title: json["title"] == null ? null : json["title"],
        isRequired: json["isRequired"] == null ? null : json["isRequired"],
        optionList: json["optionList"] == null ? null : json["optionList"],
        type: json["type"] == null ? null : json["type"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "label": label == null ? null : label,
        "title": title == null ? null : title,
        "isRequired": isRequired == null ? null : isRequired,
        "optionList": optionList == null ? null : optionList,
        "type": type == null ? null : type,
        "categoryId": categoryId == null ? null : categoryId,
      };
}
