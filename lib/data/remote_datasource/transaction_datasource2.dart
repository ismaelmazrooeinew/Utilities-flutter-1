import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/transaction.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/constants.dart';
import 'package:utilities/utils/dio_interceptor.dart';

import '../../utils/local_storage.dart';


class TransactionDataSource2 {
  final String baseUrl;

  TransactionDataSource2({required this.baseUrl});

  Future<void> read({
    required final Function(GenericResponse<TransactionReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Transaction",
        headers: <String, String>{
          "Authorization": "${getString(UtilitiesConstants.token)}",
        },
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.data, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
