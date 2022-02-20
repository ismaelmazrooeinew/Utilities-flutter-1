import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

class LocalDataSource {
  Future<List<LocationResponse>> getLocations() async {
    final String data = await DefaultAssetBundle.of(context).loadString("lib/assets/data/global_locations.json");
    final List<LocationResponse> list = <LocationResponse>[];
    for (final dynamic i in jsonDecode(data)) list.add(LocationResponse.fromMap(i));
    return list;
  }
}