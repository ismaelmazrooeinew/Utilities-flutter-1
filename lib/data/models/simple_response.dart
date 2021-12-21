import 'package:utilities/utilities.dart';

class SimpleViewModel {
  SimpleViewModel({
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

  factory SimpleViewModel.fromMap(final Map<String, dynamic> json) => SimpleViewModel(
        id: json["Id"],
        title: json["Title"],
        description: json["description"],
        type: json["type"],
        createdAt: json["createdAt"],
        media: json["Media"] == null ? null : List<MediaViewModel>.from(json["Media"].map((final dynamic x) => MediaViewModel.fromMap(x))),
        subTitle: json["SubTitle"],
        contactInformation: json["ContactInformation"] == null ? null : List<ContactInformationViewModel>.from(json["ContactInformation"].map((final dynamic x) => ContactInformationViewModel.fromMap(x))),
        useCase: json["UseCase"],
      );

  factory SimpleViewModel.fromJson(final String str) => SimpleViewModel.fromMap(json.decode(str));

  final int? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? type;
  final String? createdAt;
  final List<MediaViewModel>? media;
  final List<ContactInformationViewModel>? contactInformation;
  final int? useCase;
}

class MediaViewModel {
  MediaViewModel({
    required this.id,
    required this.type,
    required this.useCase,
    required this.link,
  });

  factory MediaViewModel.fromMap(final Map<String, dynamic> json) => MediaViewModel(
        id: json["Id"],
        type: json["Type"],
        useCase: json["useCase"],
        link: json["Link"],
      );

  factory MediaViewModel.fromJson(final String str) => MediaViewModel.fromMap(json.decode(str));

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

class ContactInformationViewModel {
  ContactInformationViewModel({
    required this.id,
    required this.value,
    required this.contactInfoItem,
    required this.visibility,
  });

  factory ContactInformationViewModel.fromJson(final String str) => ContactInformationViewModel.fromMap(json.decode(str));

  factory ContactInformationViewModel.fromMap(final Map<String, dynamic> json) => ContactInformationViewModel(
        id: json["Id"],
        value: json["Value"],
        contactInfoItem: json["ContactInfoItem"] == null ? null : SimpleViewModel.fromMap(json["ContactInfoItem"]),
        visibility: json["Visibility"],
      );

  final int? id;
  final String? value;
  final SimpleViewModel? contactInfoItem;
  final int? visibility;
}
