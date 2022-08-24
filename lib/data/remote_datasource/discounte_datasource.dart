import 'package:utilities/data/dto/discount.dart';
import 'package:utilities/utilities.dart';

class DiscountDataSource {
  final String baseUrl;

  DiscountDataSource({required this.baseUrl});

  Future<void> create({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> read({
    required final String code,
    required final Function(GenericResponse<DiscountReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Discount/$code",
        action: (Response response) => onResponse(GenericResponse<DiscountReadDto>.fromJson(response.body, fromMap: DiscountReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );


  Future<void> delete({
    required final String id,
    required final Function(GenericResponse<ContentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Content/$id",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}