import 'package:utilities/utilities.dart';

class FormDataSource {
  final String baseUrl;

  FormDataSource({required this.baseUrl});

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/Form",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> createFormField({
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<List<FormReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/Form/CreateFormField",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readByCategoryId({
    required final String categoryId,
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/$categoryId",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
