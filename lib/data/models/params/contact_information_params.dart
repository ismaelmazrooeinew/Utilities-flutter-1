import 'package:utilities/utilities.dart';

class ContactInformationParams {
  ContactInformationParams({
    required this.value,
    required this.contactInfoItemId,
    required this.visibility,
  });

  final String? value;
  final int? contactInfoItemId;
  final int? visibility;

  factory ContactInformationParams.fromJson(String str) => ContactInformationParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContactInformationParams.fromMap(Map<String, dynamic> json) => ContactInformationParams(
        value: json["value"] == null ? null : json["value"],
        contactInfoItemId: json["contactInfoItemId"] == null ? null : json["contactInfoItemId"],
        visibility: json["visibility"] == null ? null : json["visibility"],
      );

  Map<String, dynamic> toMap() => {
        "value": value == null ? null : value,
        "contactInfoItemId": contactInfoItemId == null ? null : contactInfoItemId,
        "visibility": visibility == null ? null : visibility,
      };
}
