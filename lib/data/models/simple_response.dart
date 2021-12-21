import 'package:utilities/utilities.dart';

class SimpleResponse {
  SimpleResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.createdAt,
    required this.media,
    required this.subTitle,
    required this.contactInformation,
    required this.useCase,
  });

  factory SimpleResponse.fromMap(final Map<String, dynamic> json) => SimpleResponse(
        id: json["Id"],
        title: json["Title"],
        description: json["description"],
        type: json["type"],
        createdAt: json["createdAt"],
        media: json["Media"] == null ? null : List<MediaResponse>.from(json["Media"].map((final dynamic x) => MediaResponse.fromMap(x))),
        subTitle: json["SubTitle"],
        contactInformation: json["ContactInformation"] == null ? null : List<ContactInformationResponse>.from(json["ContactInformation"].map((final dynamic x) => ContactInformationResponse.fromMap(x))),
        useCase: json["UseCase"],
      );

  factory SimpleResponse.fromJson(final String str) => SimpleResponse.fromMap(json.decode(str));

  final int? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? type;
  final String? createdAt;
  final List<MediaResponse>? media;
  final List<ContactInformationResponse>? contactInformation;
  final int? useCase;
}

class MediaResponse {
  MediaResponse({
    required this.id,
    required this.type,
    required this.useCase,
    required this.link,
  });

  factory MediaResponse.fromMap(final Map<String, dynamic> json) => MediaResponse(
        id: json["Id"],
        type: json["Type"],
        useCase: json["useCase"],
        link: json["Link"],
      );

  factory MediaResponse.fromJson(final String str) => MediaResponse.fromMap(json.decode(str));

  final int? id;
  final int? type;
  final int? useCase;
  final String? link;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "Id": id,
        "Type": type,
        "useCase": useCase,
        "Link": link,
      };
}

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
        contactInfoItem: json["ContactInfoItem"] == null ? null : SimpleResponse.fromMap(json["ContactInfoItem"]),
        visibility: json["Visibility"],
      );

  final int? id;
  final String? value;
  final SimpleResponse? contactInfoItem;
  final int? visibility;
}
