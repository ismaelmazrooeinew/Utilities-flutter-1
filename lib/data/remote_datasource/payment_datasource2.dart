import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/payment.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/constants.dart';
import 'package:utilities/utils/dio_interceptor.dart';

import '../../utils/local_storage.dart';


class PaymentDataSource2 {
  final String baseUrl;

  PaymentDataSource2({required this.baseUrl});

  Future<void> increaseWalletBalance({
    required final String amount,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "${baseUrl}Payment/IncreaseWalletBalance/$amount",
        headers: <String, String>{
          "Authorization": "${getString(UtilitiesConstants.token)}",
        },
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.data, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
      );

   Future<void> buyProduct({
    required final String productId,
    required final Function(GenericResponse<PaymentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "${baseUrl}Payment/BuyProduct/$productId",
        headers: <String, String>{
          "Authorization": "${getString(UtilitiesConstants.token)}",
        },
        action: (Response response) => onResponse(GenericResponse<PaymentReadDto>.fromJson(response.data, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

}
