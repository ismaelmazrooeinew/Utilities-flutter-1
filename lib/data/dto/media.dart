import 'package:utilities/utilities.dart';

class MediaReadDto {
  MediaReadDto({
    this.id = "-1",
    this.type = -1,
    this.useCase = "-1",
    this.link = "-1",
    this.title = "-1",
  });

  final String id;
  final int type;
  final String useCase;
  final String link;
  final String title;

  factory MediaReadDto.fromJson(String str) => MediaReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaReadDto.fromMap(Map<String, dynamic> json) => MediaReadDto(
        id: json["id"] ?? "-1",
        type: json["type"] ?? -1,
        useCase: json["useCase"] ?? "-1",
        link: json["link"] ?? "-1",
        title: json["title"] ?? "-1",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "useCase": useCase,
        "link": link,
        "title": title,
      };
}

extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<String> getImages({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.type == 0 && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getVideos({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.type == 2 && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getDocs({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.type == 3 && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo({final String? useCase}) => getVideos(useCase: useCase).getFirstIfExist() ?? "--";

  String getDoc({final String? useCase}) => getDocs(useCase: useCase).getFirstIfExist() ?? "--";
}

extension MediaResponseExtension on List<MediaReadDto> {
  List<String> getImages({final String? useCase}) => this
      .where((final MediaReadDto e) => e.type == 0 && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getVideos({final String? useCase}) => this
      .where((final MediaReadDto e) => e.type == 2 && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getDocs({final String? useCase}) => this
      .where((final MediaReadDto e) => e.type == 3 && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo({final String? useCase}) => getVideos(useCase: useCase).getFirstIfExist() ?? "--";

  String getDoc({final String? useCase}) => getDocs(useCase: useCase).getFirstIfExist() ?? "--";
}
