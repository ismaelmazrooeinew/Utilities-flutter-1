import 'package:utilities/utilities.dart';

class MediaReadDto {
  MediaReadDto({
    this.id = "-1",
    this.type = -1,
    this.useCase = "-1",
    this.link = "-1",
    this.title = "-1",
    this.file,
    this.productId,
    this.userId,
    this.categoryId,
    this.contentId,
    this.notificationId,
    this.visibility,
  });

  final String id;
  final int type;
  final String useCase;
  final String link;
  final String? file;
  final String title;
  final String? notificationId;
  final String? categoryId;
  final String? contentId;
  final String? productId;
  final int? visibility;
  final String? userId;

  factory MediaReadDto.fromJson(String str) => MediaReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaReadDto.fromMap(Map<String, dynamic> json) => MediaReadDto(
        id: json["id"] ?? "-1",
        type: json["type"] ?? -1,
        useCase: json["useCase"] ?? "-1",
        link: json["link"] ?? "-1",
        title: json["title"] ?? "-1",
        file: json["file"] == null ? null : json["file"],
        notificationId: json["notificationId"] == null ? null : json["notificationId"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        contentId: json["contentId"] == null ? null : json["contentId"],
        productId: json["productId"] == null ? null : json["productId"],
        visibility: json["visibility"] == null ? null : json["visibility"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "useCase": useCase,
        "link": link,
        "title": title,
        "file": file == null ? null : file,
        "notificationId": notificationId == null ? null : notificationId,
        "categoryId": categoryId == null ? null : categoryId,
        "contentId": contentId == null ? null : contentId,
        "productId": productId == null ? null : productId,
        "visibility": visibility == null ? null : visibility,
        "userId": userId == null ? null : userId,
      };
}

extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<String> getImages({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.link.isImageFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getAudios({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.link.isAudioFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getVideos({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.link.isVideoFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getPdfs({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.link.isPDFFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  List<String> getDocs({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.link.isDocumentFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.link,
          )
          .toList() ??
      <String>[];

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo({final String? useCase}) => getVideos(useCase: useCase).getFirstIfExist() ?? "--";

  String getDoc({final String? useCase}) => getDocs(useCase: useCase).getFirstIfExist() ?? "--";

  String getPdf({final String? useCase}) => getPdfs(useCase: useCase).getFirstIfExist() ?? "--";

  String getAudio({final String? useCase}) => getAudios(useCase: useCase).getFirstIfExist() ?? "--";
}

extension MediaResponseExtension on List<MediaReadDto> {
  List<String> getImages({final String? useCase}) => this
      .where((final MediaReadDto e) => e.link.isImageFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getAudios({final String? useCase}) => this
      .where((final MediaReadDto e) => e.link.isAudioFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getVideos({final String? useCase}) => this
      .where((final MediaReadDto e) => e.link.isVideoFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getPdfs({final String? useCase}) => this
      .where((final MediaReadDto e) => e.link.isPDFFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  List<String> getDocs({final String? useCase}) => this
      .where((final MediaReadDto e) => e.link.isDocumentFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.link,
      )
      .toList();

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo({final String? useCase}) => getVideos(useCase: useCase).getFirstIfExist() ?? "--";

  String getDoc({final String? useCase}) => getDocs(useCase: useCase).getFirstIfExist() ?? "--";

  String getPdf({final String? useCase}) => getPdfs(useCase: useCase).getFirstIfExist() ?? "--";

  String getAudio({final String? useCase}) => getAudios(useCase: useCase).getFirstIfExist() ?? "--";
}
