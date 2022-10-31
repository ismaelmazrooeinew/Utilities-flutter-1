import 'package:dio/dio.dart';
import 'package:utilities/data/dto/app_settings_v2.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/location.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class AppSettingsDataSourceV2 {
  final String baseUrl;

  AppSettingsDataSourceV2({required this.baseUrl});

  Future<void> readAppSettings({
    required final String url,
    required final Function(GenericResponse<AppSettingsDtoV2>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response<dynamic> response) => onResponse(GenericResponse<AppSettingsDtoV2>.fromJson(response.data, fromMap: AppSettingsDtoV2.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDtoV2.fromMap)),
      );

  Future<void> readAppSettings2({
    required final String url,
    required final Function(GenericResponse<AppSettingsDtoV2>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response response) => onResponse(GenericResponse<AppSettingsDtoV2>.fromJson(response.data, fromMap: AppSettingsDtoV2.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDtoV2.fromMap)),
      );

  Future<void> readLocation({
    required final String url,
    required final Function(GenericResponse<LocationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadLocation",
        action: (Response response) => onResponse(GenericResponse<LocationReadDto>.fromJson(response.data, fromMap: LocationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDtoV2.fromMap)),
      );
}
