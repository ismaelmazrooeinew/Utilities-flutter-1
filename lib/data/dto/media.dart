import 'package:utilities/utilities.dart';

class MediaReadDto {
  MediaReadDto({
    this.id = -1,
    this.type = -1,
    this.useCase = -1,
    this.link = "-1",
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "useCase": useCase == null ? null : useCase,
        "link": link == null ? null : link,
      };

  factory MediaReadDto.fromMap(final Map<String, dynamic> json) => MediaReadDto(
        id: json["Id"] ?? -1,
        type: json["Type"] ?? -1,
        useCase: json["UseCase"] ?? -1,
        link: json["Link"] ?? "-1",
      );

  factory MediaReadDto.fromJson(final String str) => MediaReadDto.fromMap(json.decode(str));

  final int? id;
  final int? type;
  final int? useCase;
  final String link;
}

extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<String> getImages() =>
      this
          ?.where((final MediaReadDto e) => e.type == 0)
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getVideos() =>
      this
          ?.where((final MediaReadDto e) => e.type == 2)
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getDocs() =>
      this
          ?.where((final MediaReadDto e) => e.type == 3)
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  String getImage() => getImages().getFirstIfExist() ?? "--";

  String getVideo() => getVideos().getFirstIfExist() ?? "--";

  String getDoc() => getDocs().getFirstIfExist() ?? "--";
}

extension MediaResponseExtension on List<MediaReadDto> {
  List<String> getImages() => this
      .where((final MediaReadDto e) => e.type == 0)
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getVideos() => this
      .where((final MediaReadDto e) => e.type == 2)
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getDocs() => this
      .where((final MediaReadDto e) => e.type == 3)
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  String getImage() => getImages().getFirstIfExist() ?? "--";

  String getVideo() => getVideos().getFirstIfExist() ?? "--";

  String getDoc() => getDocs().getFirstIfExist() ?? "--";
}
