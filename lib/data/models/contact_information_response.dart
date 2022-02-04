import 'package:utilities/utilities.dart';

class ContactInformationResponse {
  ContactInformationResponse({
    required this.id,
    required this.value,
    required this.contactInfoItem,
    required this.visibility,
  });

  factory ContactInformationResponse.fromJson(final String str) => ContactInformationResponse.fromMap(json.decode(str));

  factory ContactInformationResponse.fromMap(final Map<String, dynamic> json) => ContactInformationResponse(
        id: json["Id"],
        value: json["Value"],
        contactInfoItem: json["ContactInfoItem"] == null ? null : IdTitleResponse.fromMap(json["ContactInfoItem"]),
        visibility: json["Visibility"],
      );

  final int? id;
  final int? visibility;
  final String? value;
  final IdTitleResponse? contactInfoItem;
}
