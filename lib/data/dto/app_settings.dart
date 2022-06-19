import 'package:utilities/utilities.dart';

class AppSettingsDto {
  AppSettingsDto({
    this.categories,
    this.formFieldType,
    this.categoryUseCase,
    this.transactionStatuses,
    this.genders,
  });

  final List<CategoryReadDto>? categories;
  final List<CategoryReadDto>? formFieldType;
  final List<CategoryReadDto>? categoryUseCase;
  final List<CategoryReadDto>? transactionStatuses;
  final List<Gender>? genders;

  factory AppSettingsDto.fromJson(String str) => AppSettingsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsDto.fromMap(Map<String, dynamic> json) => AppSettingsDto(
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),
        formFieldType: json["formFieldType"] == null ? null : List<CategoryReadDto>.from(json["formFieldType"].map((x) => CategoryReadDto.fromMap(x))),
        categoryUseCase: json["categoryUseCase"] == null ? null : List<CategoryReadDto>.from(json["categoryUseCase"].map((x) => CategoryReadDto.fromMap(x))),
        transactionStatuses: json["transactionStatuses"] == null ? null : List<CategoryReadDto>.from(json["transactionStatuses"].map((x) => CategoryReadDto.fromMap(x))),
        genders: json["genders"] == null ? null : List<Gender>.from(json["genders"].map((x) => Gender.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "formFieldType": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "categoryUseCase": categoryUseCase == null ? null : List<dynamic>.from(categoryUseCase!.map((x) => x.toMap())),
        "transactionStatuses": transactionStatuses == null ? null : List<dynamic>.from(transactionStatuses!.map((x) => x.toMap())),
        "genders": genders == null ? null : List<dynamic>.from(genders!.map((x) => x.toMap())),
      };
}
