import 'package:utilities/data/dto/dashboard.dart';
import 'package:utilities/utilities.dart';

// class DashboardDataSource {
//   final String baseUrl;
//
//   DashboardDataSource({required this.baseUrl});
//
//   Future<void> createDashboard({
//     required final DashboardReadDto dto,
//     required final Function(GenericResponse<Map<String, int>>) onResponse,
//     required final Function(GenericResponse response) onError,
//   }) async =>
//       httpPost(
//         url: "$baseUrl/Dashboard",
//         body: dto,
//         action: (Response response) => onResponse(GenericResponse.fromJson(response.body,)),
//         error: (Response response) => onError(GenericResponse.fromJson(response.body,)),
//       );
//
// }