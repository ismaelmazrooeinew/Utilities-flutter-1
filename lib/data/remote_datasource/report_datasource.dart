import 'package:utilities/data/dto/report.dart';
import 'package:utilities/utilities.dart';

class ReportDataSource {
  final String baseUrl;

  ReportDataSource({required this.baseUrl});

  Future<void> create({
    required final ReportCreateUpdateDto dto,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Report",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
  
  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Report/$id",
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Report/$id",
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> filter({
    required final ReportFilterDto filter,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Report/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (Response response) {},
      );

}
