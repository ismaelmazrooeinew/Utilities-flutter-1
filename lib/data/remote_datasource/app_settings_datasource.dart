import 'package:utilities/utilities.dart';

class AppSettingsDataSource {
  final String baseUrl;

  AppSettingsDataSource({required this.baseUrl});

  Future<void> readAppSettings({
    required final String url,
    required final Function(GenericResponse<AppSettingsDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response response) => onResponse(GenericResponse<AppSettingsDto>.fromJson(response.body, fromMap: AppSettingsDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body, fromMap: AppSettingsDto.fromMap)),
      );
  Future<void> readAppSettings2({
    required final String url,
    required final Function(GenericResponse<AppSettingsDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response response) => onResponse(GenericResponse<AppSettingsDto>.fromJson(response.body, fromMap: AppSettingsDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body, fromMap: AppSettingsDto.fromMap)),
      );

  Future<void> readLocation({
    required final String url,
    required final Function(GenericResponse<LocationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadLocation",
        action: (Response response) => onResponse(GenericResponse<LocationReadDto>.fromJson(response.body, fromMap: LocationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body, fromMap: AppSettingsDto.fromMap)),
      );
}
