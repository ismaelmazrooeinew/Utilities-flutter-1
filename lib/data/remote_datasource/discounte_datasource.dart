import 'package:utilities/data/dto/discount.dart';
import 'package:utilities/utilities.dart';

class DiscountDataSource {
  final String baseUrl;

  DiscountDataSource({required this.baseUrl});


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

}
