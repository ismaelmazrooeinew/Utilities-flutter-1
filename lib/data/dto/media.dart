import 'package:utilities/utilities.dart';

class MediaReadDto {
  MediaReadDto({
    this.id='-1',
    this.type=-1,
    this.useCase=' ',
    this.link=' ',
    this.title=' ',
  });

  final String id;
  final int type;
  final String useCase;
  final String link;
  final String title;

  factory MediaReadDto.fromJson(String str) => MediaReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaReadDto.fromMap(Map<String, dynamic> json) => MediaReadDto(
    id: json["id"] == null ? null : json["id"],
    type: json["type"] == null ? null : json["type"],
    useCase: json["useCase"] == null ? null : json["useCase"],
    link: json["link"] == null ? null : json["link"],
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "type": type == null ? null : type,
    "useCase": useCase == null ? null : useCase,
    "link": link == null ? null : link,
    "title": title == null ? null : title,
  };
}

extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<String> getImages({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.type == 0 )
          .where((final MediaReadDto e) => useCase != null && e.useCase==useCase)
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

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo() => getVideos().getFirstIfExist() ?? "--";

  String getDoc() => getDocs().getFirstIfExist() ?? "--";
}

extension MediaResponseExtension on List<MediaReadDto> {
  List<String> getImages({final String? useCase}) => this
      .where((final MediaReadDto e) => e.type == 0)
      .where((final MediaReadDto e) => useCase != null && e.useCase==useCase)
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

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo() => getVideos().getFirstIfExist() ?? "--";

  String getDoc() => getDocs().getFirstIfExist() ?? "--";
}
