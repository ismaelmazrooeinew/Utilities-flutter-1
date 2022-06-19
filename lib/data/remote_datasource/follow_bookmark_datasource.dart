import 'package:utilities/data/dto/follow_bookmark.dart';
import 'package:utilities/utilities.dart';

class FollowDataSource {
  final String baseUrl;

  FollowDataSource({required this.baseUrl});

  Future<void> readFollowers({
    required final Function(GenericResponse<FolowersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowers/ReadFollowers",
        action: (Response response) => onResponse(GenericResponse<FolowersReadDto>.fromJson(response.body, FolowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> readFollowings({
    required final Function(GenericResponse<FolowersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowings/ReadFollowings",
        action: (Response response) => onResponse(GenericResponse<FolowersReadDto>.fromJson(response.body, FolowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> removeFollowing({
    required final FolowersReadDto dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/RemoveFollowing/RemoveFollowing",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FolowersReadDto>.fromJson(response.body, FolowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleBookmark/ToggleBookmark",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FolowersReadDto>.fromJson(response.body, FolowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> toggleFollow({
    required final FolowersReadDto dto,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleFollow/ToggleFolllow",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FolowersReadDto>.fromJson(response.body, FolowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );
}
