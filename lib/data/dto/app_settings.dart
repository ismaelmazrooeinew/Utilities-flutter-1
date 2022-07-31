import 'package:utilities/utilities.dart';

@JObj()
class AppSettingsDto {
  AppSettingsDto({
    this.formFieldType,
    this.genders,
  });

  final List<CategoryReadDto>? formFieldType;
  final List<Gender>? genders;

  factory AppSettingsDto.fromJson(String str) => AppSettingsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsDto.fromMap(Map<String, dynamic> json) => AppSettingsDto(
        formFieldType: json["formFieldType"] == null ? null : List<CategoryReadDto>.from(json["formFieldType"].map((x) => CategoryReadDto.fromMap(x))),
        genders: json["genders"] == null ? null : List<Gender>.from(json["genders"].map((x) => Gender.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "formFieldType": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "genders": genders == null ? null : List<dynamic>.from(genders!.map((x) => x.toMap())),
      };
}
