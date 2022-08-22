import 'package:flutter/services.dart' show rootBundle;
import 'package:utilities/utilities.dart';

class LocalDataSource {
  Future<List<LocationReadDto>> getLocations() async {
    final String data = await rootBundle.loadString("packages/utilities/lib/assets/data/global_locations.json");
    final List<LocationReadDto> list = <LocationReadDto>[];
    for (final dynamic i in jsonDecode(data)) list.add(LocationReadDto.fromMap(i));
    return list;
  }

  Future<List<IranLocationReadDto>> getIranLocations() async {
    final String data = await rootBundle.loadString("packages/utilities/lib/assets/data/iran.json");
    final List<IranLocationReadDto> list = <IranLocationReadDto>[];
    for (final dynamic i in jsonDecode(data)) list.add(IranLocationReadDto.fromMap(i));
    return list;
  }
}
