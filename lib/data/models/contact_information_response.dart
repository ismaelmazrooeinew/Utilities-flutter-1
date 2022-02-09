import 'package:utilities/utilities.dart';

class ContactInformationResponse {
  ContactInformationResponse({
    required this.id,
    required this.value,
    required this.contactInfoItem,
    required this.visibility,
    required this.link,
  });

  factory ContactInformationResponse.fromJson(final String str) => ContactInformationResponse.fromMap(json.decode(str));

  factory ContactInformationResponse.fromMap(final Map<String, dynamic> json) => ContactInformationResponse(
        id: json["Id"],
        value: json["Value"],
        contactInfoItem: json["ContactInfoItem"] == null ? null : IdTitleResponse.fromMap(json["ContactInfoItem"]),
        visibility: json["Visibility"],
        link: json["Link"],
      );

  final int? id;
  final int? visibility;
  final String? value;
  final String? link;
  final IdTitleResponse? contactInfoItem;
}
