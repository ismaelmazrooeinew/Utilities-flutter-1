import 'package:utilities/utilities.dart';

class ContactInformationViewModel {
  ContactInformationViewModel({
    this.id = -1,
    this.value = "",
    this.socialKey = "",
    this.socialValue = "",
    this.socialIconUrl = "",
    this.visibility = VisibilityType.public,
    this.link,
  });

  final int id;
  String value;
  final String socialKey;
  final String socialValue;
  final String socialIconUrl;
  final VisibilityType visibility;
  final String? link;
}

class ContactInfoItemViewModel {
  ContactInfoItemViewModel({required this.id, required this.title, required this.iconUrl});

  final int id;
  final String title;
  final String iconUrl;
}
