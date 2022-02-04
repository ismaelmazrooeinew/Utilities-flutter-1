import 'package:utilities/utilities.dart';

class MediaViewModel {
  MediaViewModel({required this.link, this.type = MediaType.image});

  final MediaType type;
  final String link;
}