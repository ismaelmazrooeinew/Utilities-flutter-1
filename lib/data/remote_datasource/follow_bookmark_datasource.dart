import 'package:dio/dio.dart';
import 'package:utilities/data/dto/follow_bookmark.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class FollowBookmarkDataSource {
  final String baseUrl;

  FollowBookmarkDataSource({required this.baseUrl});

  Future<void> readBookmarks({
    required final Function(GenericResponse<BookmarkReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadBookmarks",
        action: (Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.data, fromMap: BookmarkReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readFollowers({
    required final String userId,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowers/$userId",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse()),
      );

  Future<void> readFollowings({
    required final String userId,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowings/$userId",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse()),
      );

  Future<void> removeFollowing({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/RemoveFollowing",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>()),
        error: (Response response) => onError(GenericResponse()),
      );

  Future<void> toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleBookmark",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>()),
        error: (Response response) => onError(GenericResponse()),
      );

  Future<void> toggleFollow({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleFolllow",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>()),
        error: (Response response) => onError(GenericResponse()),
      );
}
