import 'package:flutter/cupertino.dart';
import 'package:utilities/data/dto/transaction.dart';
import 'package:utilities/utilities.dart';

class TransactionDataSource {
  final String baseUrl;

  TransactionDataSource({required this.baseUrl});

  Future<void> read({
    required final Function(GenericResponse<TransactionReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Transaction",
        headers: <String, String>{
          "Authorization": "${getString(UtilitiesConstants.token)}" ?? "",
        },
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );


}
