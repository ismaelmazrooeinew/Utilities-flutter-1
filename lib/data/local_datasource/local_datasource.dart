import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

class LocalDataSource {
  Future<List<UtilitiesLocationResponse>> getLocations() async {
    final String data = await DefaultAssetBundle.of(context).loadString("lib/assets/data/global_locations.json");
    final List<UtilitiesLocationResponse> list = <UtilitiesLocationResponse>[];
    for (final dynamic i in jsonDecode(data)) list.add(UtilitiesLocationResponse.fromMap(i));
    return list;
  }
}