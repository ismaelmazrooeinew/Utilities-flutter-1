import 'package:utilities/utilities.dart';

class MediaDataSource   {
  final String baseUrl;

  MediaDataSource  ({required this.baseUrl});
  Future<void> create({
    required final MediaReadDto dto,
    required final Function(GenericResponse<MediaReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Media",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, MediaReadDto.fromMap)),
      );
  
  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, MediaReadDto.fromMap)),
      );
}
