import 'package:utilities/utilities.dart';

class ContentReadDto {
  ContentReadDto({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.link,
    required this.media,
    required this.contactInformation,
    required this.useCase,
  });

  factory ContentReadDto.fromJson(final String str) => ContentReadDto.fromMap(json.decode(str));

  factory ContentReadDto.fromMap(final Map<String, dynamic> json) => ContentReadDto(
        id: json["Id"],
        title: json["Title"],
        subTitle: json["SubTitle"],
        description: json["Description"],
        link: json["Link"],
        media: json["Media"] == null ? null : List<MediaReadDto>.from(json["Media"].map((final dynamic x) => MediaReadDto.fromMap(x))),
        contactInformation: json["ContactInformation"] == null ? null : List<ContactInformationReadDto>.from(json["ContactInformation"].map((final dynamic x) => ContactInformationReadDto.fromMap(x))),
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
  final List<MediaReadDto>? media;
  final List<ContactInformationReadDto>? contactInformation;
}
