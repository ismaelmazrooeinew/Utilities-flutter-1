import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/report.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class ReportDataSource2 {
  final String baseUrl;

  ReportDataSource2({required this.baseUrl});

  Future<void> create({
    required final ReportCreateUpdateDto dto,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Report",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Report/$id",
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete3(
        url: "$baseUrl/Report/$id",
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> filter({
    required final ReportFilterDto filter,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Report/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
        error: (Response response) {},
      );
}
