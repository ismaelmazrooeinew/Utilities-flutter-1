import 'package:utilities/utilities.dart';

class IdTitleResponse {
  IdTitleResponse({
    required this.id,
    required this.title,
    required this.media,
  });

  factory IdTitleResponse.fromJson(final String str) => IdTitleResponse.fromMap(json.decode(str));

  factory IdTitleResponse.fromMap(final Map<String, dynamic> json) => IdTitleResponse(
        id: json["Id"],
        title: json["Title"],
        media: json["Media"] == null ? null : List<MediaResponse>.from(json["Media"].map((final dynamic x) => MediaResponse.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "Id": id,
        "Title": title,
        "Media": media == null ? null : List<dynamic>.from(media!.map((final dynamic x) => x.toMap())),
      };

  final int? id;
  final String? title;
  final List<MediaResponse>? media;
}

extension NullableIdTitleResponseExtension on List<IdTitleResponse>? {
  List<String> getTitles() => this?.map((final IdTitleResponse e) => e.title ?? "--").toList() ?? <String>[];
}

extension IdTitleResponseExtension on List<IdTitleResponse> {
  List<String> getTitles() => map((final IdTitleResponse e) => e.title ?? "--").toList();
}