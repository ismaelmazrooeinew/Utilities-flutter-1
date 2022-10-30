import 'package:utilities/utilities.dart';

class AppSettingsDto {
  AppSettingsDto({
    this.formFieldType,
    this.genders,
    this.appSettings,
  });

  final List<FormFieldTypeDto>? formFieldType;
  final List<Gender>? genders;
  final AppSettings? appSettings;

  factory AppSettingsDto.fromJson(String str) => AppSettingsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsDto.fromMap(Map<String, dynamic> json) => AppSettingsDto(
        formFieldType: json["formFieldType"] == null ? null : List<FormFieldTypeDto>.from(json["formFieldType"].map((x) => FormFieldTypeDto.fromMap(x))),
        genders: json["genders"] == null ? null : List<Gender>.from(json["genders"].map((x) => Gender.fromMap(x))),
        appSettings: json["appSettings"] == null ? null : AppSettings.fromMap(json["appSettings"]),
      );

  Map<String, dynamic> toMap() => {
        "formFieldType": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "appSettings": appSettings == null ? null : appSettings!.toMap(),
        "genders": genders == null ? null : List<dynamic>.from(genders!.map((x) => x.toMap())),
      };
}

class AppSettings {
  AppSettings({
    this.androidDownloadLink1,
    this.androidDownloadLink2,
    this.androidLatestVersion,
    this.androidMinimumVersion,
    this.iosDownloadLink1,
    this.iosDownloadLink2,
    this.iosLatestVersion,
    this.iosMinimumVersion,
  });

  final String? androidMinimumVersion;
  final String? androidLatestVersion;
  final String? iosMinimumVersion;
  final String? iosLatestVersion;
  final String? androidDownloadLink1;
  final String? androidDownloadLink2;
  final String? iosDownloadLink1;
  final String? iosDownloadLink2;

  factory AppSettings.fromJson(String str) => AppSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettings.fromMap(Map<String, dynamic> json) => AppSettings(
        androidMinimumVersion: json["androidMinimumVersion"] == null ? null : json["androidMinimumVersion"],
        androidLatestVersion: json["androidLatestVersion"] == null ? null : json["androidLatestVersion"],
        iosMinimumVersion: json["iosMinimumVersion"] == null ? null : json["iosMinimumVersion"],
        iosLatestVersion: json["iosLatestVersion"] == null ? null : json["iosLatestVersion"],
        androidDownloadLink1: json["androidDownloadLink1"] == null ? null : json["androidDownloadLink1"],
        androidDownloadLink2: json["androidDownloadLink2"] == null ? null : json["androidDownloadLink2"],
        iosDownloadLink1: json["iosDownloadLink1"] == null ? null : json["iosDownloadLink1"],
        iosDownloadLink2: json["iosDownloadLink2"] == null ? null : json["iosDownloadLink2"],
      );

  Map<String, dynamic> toMap() => {
        "androidMinimumVersion": androidMinimumVersion == null ? null : androidMinimumVersion,
        "androidLatestVersion": androidLatestVersion == null ? null : androidLatestVersion,
        "iosMinimumVersion": iosMinimumVersion == null ? null : iosMinimumVersion,
        "iosLatestVersion": iosLatestVersion == null ? null : iosLatestVersion,
        "androidDownloadLink1": androidDownloadLink1 == null ? null : androidDownloadLink1,
        "androidDownloadLink2": androidDownloadLink2 == null ? null : androidDownloadLink2,
        "iosDownloadLink1": iosDownloadLink1 == null ? null : iosDownloadLink1,
        "iosDownloadLink2": iosDownloadLink2 == null ? null : iosDownloadLink2,
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
