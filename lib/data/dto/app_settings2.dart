import 'package:utilities/utilities.dart';

class AppSettingsDto2 {
  AppSettingsDto2({
    this.formFieldType,
  });

  final List<FormFieldTypeDto>? formFieldType;

  factory AppSettingsDto2.fromJson(String str) => AppSettingsDto2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsDto2.fromMap(Map<String, dynamic> json) => AppSettingsDto2(
        formFieldType: json["formFieldType"] == null ? null : List<FormFieldTypeDto>.from(json["formFieldType"].map((x) => FormFieldTypeDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "formFieldType": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
      };
}

class FormFieldTypeDto {
  FormFieldTypeDto({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory FormFieldTypeDto.fromJson(String str) => FormFieldTypeDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldTypeDto.fromMap(Map<String, dynamic> json) => FormFieldTypeDto(
        id: json["id"] == null ? null : json["id"],
        title: json["androidLatestVersion"] == null ? null : json["androidLatestVersion"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
