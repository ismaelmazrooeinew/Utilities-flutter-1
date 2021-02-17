part of '../utilities.dart';

Future setData(String key, dynamic value) async {
  final box = GetStorage();
  box.write(key, value);
}

Future<int> getInt(String key) async {
  final box = GetStorage();
  return box.read(key);
}

Future<bool> getBool(String key) async {
  final box = GetStorage();
  return box.read(key);
}

Future<double> getDouble(String key) async {
  final box = GetStorage();
  return box.read(key);
}

Future<String> getString(String key) async {
  final box = GetStorage();
  return box.read(key);
}

Future<dynamic> getData(String key) async {
  final box = GetStorage();
  return box.read(key);
}

Future clearData() async => await GetStorage().erase();
