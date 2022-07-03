import 'package:utilities/data/dto/block.dart';
import 'package:utilities/utilities.dart';

class BlockDataSource {
  final String baseUrl;

  BlockDataSource({required this.baseUrl});

  Future<void> create({
    required final String userId,
    required final Function(GenericResponse<BlockReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Block?userId=$userId",
        action: (Response response) => onResponse(GenericResponse<BlockReadDto>.fromJson(response.body, BlockReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, BlockReadDto.fromMap)),
      );


  Future<void> read({
    required final Function(GenericResponse<BlockReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Block",
        action: (Response response) => onResponse(GenericResponse<BlockReadDto>.fromJson(response.body, BlockReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, BlockReadDto.fromMap)),
      );
  Future<void> readMine({
    required final Function(GenericResponse<BlockReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Block/ReadMine",
        action: (Response response) => onResponse(GenericResponse<BlockReadDto>.fromJson(response.body, BlockReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, BlockReadDto.fromMap)),
      );
}
