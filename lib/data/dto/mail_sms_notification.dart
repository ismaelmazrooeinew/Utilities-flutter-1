import 'package:utilities/utilities.dart';

class CreateMailSmsNotificationDto {
  CreateMailSmsNotificationDto({
    this.userIds,
    this.title,
    this.message,
  });

  final List<String>? userIds;
  final String? title;
  final String? message;

  factory CreateMailSmsNotificationDto.fromJson(String str) => CreateMailSmsNotificationDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateMailSmsNotificationDto.fromMap(Map<String, dynamic> json) => CreateMailSmsNotificationDto(
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "userIds": userIds == null ? [] : List<String>.from(userIds!.map((x) => x)),
        "title": title,
        "message": message,
      };
}
