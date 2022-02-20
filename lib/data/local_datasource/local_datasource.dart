import 'package:utilities/utilities.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalDataSource {
  Future<List<LocationResponse>> getLocations() async {
    final String data = await rootBundle.loadString("lib/assets/data/global_locations.json");
    final List<LocationResponse> list = <LocationResponse>[];
    for (final dynamic i in jsonDecode(data)) list.add(LocationResponse.fromMap(i));
    return list;
  }
}