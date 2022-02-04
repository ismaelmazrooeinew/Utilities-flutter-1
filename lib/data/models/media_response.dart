import 'package:utilities/utilities.dart';

class MediaResponse {
  MediaResponse({
    this.id = -1,
    this.type = -1,
    this.useCase = -1,
    this.link = "-1",
  });

  factory MediaResponse.fromMap(final Map<String, dynamic> json) => MediaResponse(
        id: json["Id"] ?? -1,
        type: json["Type"] ?? -1,
        useCase: json["UseCase"] ?? -1,
        link: json["Link"] ?? "-1",
      );

  factory MediaResponse.fromJson(final String str) => MediaResponse.fromMap(json.decode(str));

  final int id;
  final int type;
  final int useCase;
  final String link;
}

extension NullableMediaResponseExtension on List<MediaResponse>? {
  List<String> getImages() =>
      this
          ?.where((final MediaResponse e) => e.type == 0)
          .map(
            (final MediaResponse e) => e.link,
      )
          .toList() ??
          <String>[];

  List<String> getVideos() =>
      this
          ?.where((final MediaResponse e) => e.type == 2)
          .map(
            (final MediaResponse e) => e.link,
      )
          .toList() ??
          <String>[];

  List<String> getDocs() =>
      this
          ?.where((final MediaResponse e) => e.type == 3)
          .map(
            (final MediaResponse e) => e.link,
      )
          .toList() ??
          <String>[];

  String getImage() => getImages().getFirstIfExist() ?? "--";

  String getVideo() => getVideos().getFirstIfExist() ?? "--";

  String getDoc() => getDocs().getFirstIfExist() ?? "--";
}

extension MediaResponseExtension on List<MediaResponse> {
  List<String> getImages() => this
      .where((final MediaResponse e) => e.type == 0)
      .map(
        (final MediaResponse e) => e.link,
  )
      .toList();

  List<String> getVideos() => this
      .where((final MediaResponse e) => e.type == 2)
      .map(
        (final MediaResponse e) => e.link,
  )
      .toList();

  List<String> getDocs() => this
      .where((final MediaResponse e) => e.type == 3)
      .map(
        (final MediaResponse e) => e.link,
  )
      .toList();

  String getImage() => getImages().getFirstIfExist() ?? "--";

  String getVideo() => getVideos().getFirstIfExist() ?? "--";

  String getDoc() => getDocs().getFirstIfExist() ?? "--";
}