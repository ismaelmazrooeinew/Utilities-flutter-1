import 'package:utilities/utilities.dart';

class FollowDataSource {
  final String baseUrl;

  FollowDataSource({required this.baseUrl});

  Future<void> readFollowers({
    required final Function(GenericResponse<FollowersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowers/ReadFollowers",
        action: (Response response) => onResponse(GenericResponse<FollowersReadDto>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> readFollowings({
    required final Function(GenericResponse<FollowersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowings/ReadFollowings",
        action: (Response response) => onResponse(GenericResponse<FollowersReadDto>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> removeFollowing({
    required final FollowersReadDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/RemoveFollowing/RemoveFollowing",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleBookmark/ToggleBookmark",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> toggleFollow({
    required final FollowersReadDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleFollow/ToggleFolllow",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, FollowersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );
}
