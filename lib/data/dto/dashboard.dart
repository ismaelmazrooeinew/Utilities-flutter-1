import 'package:utilities/utilities.dart';

class DashboardReadDto {
  DashboardReadDto({
    this.stardDate,
    this.endDate,
  });

  final String? stardDate;
  final String? endDate;

  factory DashboardReadDto.fromJson(String str) => DashboardReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DashboardReadDto.fromMap(Map<String, dynamic> json) => DashboardReadDto(
    stardDate: json["stardDate"] == null ? null : json["stardDate"],
    endDate: json["endDate"] == null ? null : json["endDate"],
  );

  Map<String, dynamic> toMap() => {
    "stardDate": stardDate == null ? null : stardDate,
    "endDate": endDate == null ? null : endDate,
  };
}
