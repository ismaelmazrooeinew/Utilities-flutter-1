import 'package:utilities/utilities.dart';

class MediaReadDto {
  MediaReadDto({
    this.id = "-1",
    this.type = -1,
    this.useCase = "-1",
    this.link = "-1",
    this.url = "-1",
    this.title = "-1",
    this.file,
    this.fileName,
    this.fileType,
    this.productId,
    this.userId,
    this.categoryId,
    this.contentId,
    this.notificationId,
    this.visibility,
    this.size,
  });

  final String id;
  final int type;
  final String useCase;
  final String link;
  final String url;
  final String? file;
  final String? fileName;
  final String? fileType;
  final String title;
  final String? notificationId;
  final String? categoryId;
  final String? contentId;
  final String? productId;
  final int? visibility;
  final String? userId;
  final String? size;

  factory MediaReadDto.fromJson(String str) => MediaReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaReadDto.fromMap(Map<String, dynamic> json) => MediaReadDto(
        id: json["id"] ?? "-1",
        type: json["type"] ?? -1,
        useCase: json["useCase"] ?? "-1",
        link: json["link"] ?? "-1",
        url: json["url"] ?? "-1",
        title: json["title"] ?? "-1",
        file: json["file"] == null ? null : json["file"],
        fileName: json["fileName"] == null ? null : json["fileName"],
        fileType: json["fileName"] == null ? null : json["fileName"].toString().split('.')[1],
        notificationId: json["notificationId"] == null ? null : json["notificationId"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        contentId: json["contentId"] == null ? null : json["contentId"],
        productId: json["productId"] == null ? null : json["productId"],
        visibility: json["visibility"] == null ? null : json["visibility"],
        userId: json["userId"] == null ? null : json["userId"],
        size: json["size"] == null ? null : json["size"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "useCase": useCase,
        "link": link,
        "url": url,
        "title": title,
        "file": file == null ? null : file,
        "fileName": fileName == null ? null : fileName,
        "notificationId": notificationId == null ? null : notificationId,
        "categoryId": categoryId == null ? null : categoryId,
        "contentId": contentId == null ? null : contentId,
        "productId": productId == null ? null : productId,
        "visibility": visibility == null ? null : visibility,
        "userId": userId == null ? null : userId,
        "size": size == null ? null : size,
      };
}

extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<String> getImages({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isImageFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getImagesUrl({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isImageFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  String getImageUrl() => this!.length > 0 ? this!.first.url : "--";

  String getAvatar() {
    List<String> list = this!
        .where((final MediaReadDto e) => e.url.isImageFileName && ((e.useCase == 'avatar')))
        .map(
          (final MediaReadDto e) => e.url,
        )
        .toList();
    return list.isNotEmpty ? list.first : "--";
  }

  List<String> getAudios({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isAudioFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getVideos({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isVideoFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getPdfs({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isPDFFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getDocs({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isDocumentFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url,
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
      .where((final MediaReadDto e) => e.url.isImageFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getAudios({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url.isAudioFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getVideos({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url.isVideoFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getPdfs({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url.isPDFFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getDocs({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url.isDocumentFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo({final String? useCase}) => getVideos(useCase: useCase).getFirstIfExist() ?? "--";

  String getDoc({final String? useCase}) => getDocs(useCase: useCase).getFirstIfExist() ?? "--";

  String getPdf({final String? useCase}) => getPdfs(useCase: useCase).getFirstIfExist() ?? "--";

  String getAudio({final String? useCase}) => getAudios(useCase: useCase).getFirstIfExist() ?? "--";
}
