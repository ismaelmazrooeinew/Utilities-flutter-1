import 'package:utilities/utilities.dart';

class AppSettingsDto {
  AppSettingsDto({
    required this.colors,
    required this.favorites,
    required this.specialties,
    required this.categories,
    required this.formFieldType,
    required this.categoryUseCase,
  });

  final List<IdTitleReadDto>? colors;
  final List<IdTitleReadDto>? favorites;
  final List<IdTitleReadDto>? specialties;
  final List<IdTitleReadDto>? categories;
  final List<IdTitleReadDto>? formFieldType;
  final List<IdTitleReadDto>? categoryUseCase;

  factory AppSettingsDto.fromJson(String str) => AppSettingsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsDto.fromMap(Map<String, dynamic> json) => AppSettingsDto(
        colors: json["colors"] == null ? null : List<IdTitleReadDto>.from(json["colors"].map((x) => IdTitleReadDto.fromMap(x))),
        favorites: json["favorites"] == null ? null : List<IdTitleReadDto>.from(json["favorites"].map((x) => IdTitleReadDto.fromMap(x))),
        specialties: json["specialties"] == null ? null : List<IdTitleReadDto>.from(json["specialties"].map((x) => IdTitleReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<IdTitleReadDto>.from(json["categories"].map((x) => IdTitleReadDto.fromMap(x))),
        formFieldType: json["formFieldType"] == null ? null : List<IdTitleReadDto>.from(json["formFieldType"].map((x) => IdTitleReadDto.fromMap(x))),
        categoryUseCase: json["categoryUseCase"] == null ? null : List<IdTitleReadDto>.from(json["categoryUseCase"].map((x) => IdTitleReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "colors": colors == null ? null : List<dynamic>.from(colors!.map((x) => x.toMap())),
        "favorites": favorites == null ? null : List<dynamic>.from(favorites!.map((x) => x.toMap())),
        "specialties": specialties == null ? null : List<dynamic>.from(specialties!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "formFieldType": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "categoryUseCase": categoryUseCase == null ? null : List<dynamic>.from(categoryUseCase!.map((x) => x.toMap())),
      };
}
