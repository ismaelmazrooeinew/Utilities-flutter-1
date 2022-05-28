import 'package:utilities/utilities.dart';

enum IdTitleDataSourceType {
  brand("Brand"),
  category("Category"),
  reference("Reference");

  final String title;

  const IdTitleDataSourceType(this.title);

  @override
  String toString() => name;
}

class IdTitleDataSource {
  final String baseUrl;
  final IdTitleDataSourceType type;

  IdTitleDataSource({required this.baseUrl, required this.type});

  Future<void> create({
    required final String url,
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> update({
    required final String url,
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      put(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> read({
    required final String url,
    required final Function(GenericResponse<List<IdTitleReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readById({
    required final String url,
    required final String id,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
