import 'package:utilities/data/dto/global_search.dart';
import 'package:utilities/utilities.dart';

class GlobalSearchDataSource {
  final String baseUrl;

  GlobalSearchDataSource({required this.baseUrl});

  Future<void> create({
    required final GlobalSearchCreateDto dto,
    required final Function(GenericResponse<GlobalSearchReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/GlobalSearch",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<GlobalSearchReadDto>.fromJson(response.body, fromMap: GlobalSearchReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
