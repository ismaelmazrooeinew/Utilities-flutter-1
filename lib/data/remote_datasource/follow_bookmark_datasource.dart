import 'package:utilities/data/dto/follow_bookmark.dart';
import 'package:utilities/utilities.dart';

class FollowDataSource {
  final String baseUrl;

  FollowDataSource({required this.baseUrl});


  Future<void> readFollowers({
    required final Function(GenericResponse<List<FolowersReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/FollowBookmark/ReadFollowers/ReadFollowers",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readFollowings({
    required final Function(GenericResponse<List<FolowersReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/FollowBookmark/ReadFollowings/ReadFollowings",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> removeFollowing({
    required final FormReadDto dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/FollowBookmark/RemoveFollowing/RemoveFollowing",
        body:dto ,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/FollowBookmark/ToggleBookmark/ToggleBookmark",
        body:dto ,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

}
