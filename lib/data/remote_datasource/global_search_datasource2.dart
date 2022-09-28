import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/global_search.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class GlobalSearchDataSource2 {
  final String baseUrl;

  GlobalSearchDataSource2({required this.baseUrl});

  Future<void> create({
    required final GlobalSearchCreateDto dto,
    required final Function(GenericResponse<GlobalSearchReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/GlobalSearch",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<GlobalSearchReadDto>.fromJson(response.data, fromMap: GlobalSearchReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
      );
}
