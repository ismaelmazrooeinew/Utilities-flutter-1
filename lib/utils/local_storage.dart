part of '../utilities.dart';

Future setData(String key, dynamic value) async => Hive.box(key).put(key, value);

Future<int> getInt(String key) async => Hive.box(key).get(key);

Future<bool> getBool(String key) async => Hive.box(key).get(key);

Future<double> getDouble(String key) async => Hive.box(key).get(key);

Future<String> getString(String key) async => Hive.box(key).get(key);

Future<dynamic> getData(String key) async => Hive.box(key).get(key);

Future clearData() async => await Hive.deleteFromDisk();
