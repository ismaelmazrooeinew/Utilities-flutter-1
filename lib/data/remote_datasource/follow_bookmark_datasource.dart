import 'package:utilities/utilities.dart';

class FollowBookmarkDataSource {
  final String baseUrl;

  FollowBookmarkDataSource({required this.baseUrl});

  Future<void> readBookmarks({
    required final Function(GenericResponse<BookmarkReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadBookmarks",
        action: (Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.body, BookmarkReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, BookmarkReadDto.fromMap)),
      );

  Future<void> readFollowers({
    required final Function(GenericResponse<FollowersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowers",
        action: (Response response) => onResponse(GenericResponse<FollowersReadDto>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
      );

  Future<void> readFollowings({
    required final Function(GenericResponse<FollowersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowings",
        action: (Response response) => onResponse(GenericResponse<FollowersReadDto>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
      );

  Future<void> removeFollowing({
    required final FollowersReadDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/RemoveFollowing",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
      );

  Future<void> toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleBookmark",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> toggleFollow({
    required final FollowersReadDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleFollow",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
      );
}
