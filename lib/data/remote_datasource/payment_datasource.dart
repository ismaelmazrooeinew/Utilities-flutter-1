import 'package:utilities/data/dto/payment.dart';
import 'package:utilities/utilities.dart';

class PaymentDataSource {
  final String baseUrl;

  PaymentDataSource({required this.baseUrl});

  Future<void> increaseWalletBalance({
    required final String amount,
    required final Function(GenericResponse<PaymentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Payment/IncreaseWalletBalance/$amount",
        headers: <String, String>{
          "Authorization": "${getString(UtilitiesConstants.token)}",
        },
        action: (Response response) => onResponse(GenericResponse<PaymentReadDto>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

   Future<void> buyProduct({
    required final String productId,
    required final Function(GenericResponse<PaymentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Payment/BuyProduct/$productId",
        headers: <String, String>{
          "Authorization": "${getString(UtilitiesConstants.token)}",
        },
        action: (Response response) => onResponse(GenericResponse<PaymentReadDto>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

}
