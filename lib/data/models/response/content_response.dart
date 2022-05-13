import 'package:utilities/utilities.dart';

class ContentResponse {
  ContentResponse({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.link,
    required this.media,
    required this.contactInformation,
    required this.useCase,
  });

  factory ContentResponse.fromJson(final String str) => ContentResponse.fromMap(json.decode(str));

  factory ContentResponse.fromMap(final Map<String, dynamic> json) => ContentResponse(
        id: json["Id"],
        title: json["Title"],
        subTitle: json["SubTitle"],
        description: json["Description"],
        link: json["Link"],
        media: json["Media"] == null ? null : List<MediaResponse>.from(json["Media"].map((final dynamic x) => MediaResponse.fromMap(x))),
        contactInformation: json["ContactInformation"] == null ? null : List<ContactInformationResponse>.from(json["ContactInformation"].map((final dynamic x) => ContactInformationResponse.fromMap(x))),
        useCase: json["UseCase"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "Id": id,
        "Title": title,
        "SubTitle": subTitle,
        "Description": description,
        "Link": link,
        "Media": media == null ? null : List<dynamic>.from(media!.map((final dynamic x) => x.toMap())),
        "ContactInformation": contactInformation == null ? null : List<dynamic>.from(contactInformation!.map((final dynamic x) => x.toMap())),
        "UseCase": useCase,
      };

  final int? id;
  final int? useCase;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? link;
  final List<MediaResponse>? media;
  final List<ContactInformationResponse>? contactInformation;
}
