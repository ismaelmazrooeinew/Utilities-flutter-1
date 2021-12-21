import 'package:utilities/utilities.dart';

class SimpleViewModel {
  SimpleViewModel({
    this.id = -1,
    this.title = "-1",
    this.description = "-1",
    this.type = -1,
    this.createdAt = "-1",
    this.subTitle = "-1",
    this.useCase = -1,
    this.link = "-1",
    this.contactInformation,
    this.media,
  });

  factory SimpleViewModel.fromMap(final Map<String, dynamic> json) => SimpleViewModel(
        id: json["Id"] ?? -1,
        title: json["Title"] ?? "-1",
        description: json["description"] ?? "-1",
        type: json["type"] ?? -1,
        createdAt: json["createdAt"] ?? "-1",
        media: json["Media"] == null ? null : List<MediaViewModel>.from(json["Media"].map((final dynamic x) => MediaViewModel.fromMap(x))),
        subTitle: json["SubTitle"] ?? "-1",
        contactInformation: json["ContactInformation"] == null ? null : List<ContactInformationViewModel>.from(json["ContactInformation"].map((final dynamic x) => ContactInformationViewModel.fromMap(x))),
        useCase: json["UseCase"] ?? -1,
        link: json["Link"] ?? "-1",
      );

  factory SimpleViewModel.fromJson(final String str) => SimpleViewModel.fromMap(json.decode(str));

  final int id;
  final String title;
  final String subTitle;
  final String link;
  final String createdAt;
  final String description;
  final int type;
  final int useCase;
  final List<MediaViewModel>? media;
  final List<ContactInformationViewModel>? contactInformation;
}

class MediaViewModel {
  MediaViewModel({
    this.id = -1,
    this.type = -1,
    this.useCase = -1,
    this.link = "-1",
  });

  factory MediaViewModel.fromMap(final Map<String, dynamic> json) => MediaViewModel(
        id: json["Id"] ?? -1,
        type: json["Type"] ?? -1,
        useCase: json["useCase"] ?? -1,
        link: json["Link"] ?? "-1",
      );

  factory MediaViewModel.fromJson(final String str) => MediaViewModel.fromMap(json.decode(str));

  final int id;
  final int type;
  final int useCase;
  final String link;
}

class ContactInformationViewModel {
  ContactInformationViewModel({
    this.id = -1,
    this.value = "-1",
    this.contactInfoItem,
    this.visibility = -1,
  });

  factory ContactInformationViewModel.fromJson(final String str) => ContactInformationViewModel.fromMap(json.decode(str));

  factory ContactInformationViewModel.fromMap(final Map<String, dynamic> json) => ContactInformationViewModel(
        id: json["Id"] ?? -1,
        value: json["Value"] ?? "-1",
        contactInfoItem: json["ContactInfoItem"] == null ? null : SimpleViewModel.fromMap(json["ContactInfoItem"]),
        visibility: json["Visibility"] ?? -1,
      );

  final int id;
  final String value;
  final SimpleViewModel? contactInfoItem;
  final int visibility;
}
