part of '../utilities.dart';

void setData(String key, dynamic value) => GetStorage().write(key, value);

int getInt(String key) => GetStorage().read(key);

String getString(String key) => GetStorage().read(key);

bool getBool(String key) => GetStorage().read(key);

double getDouble(String key) => GetStorage().read(key);

dynamic getData(String key) => GetStorage().read(key);

Future clearData() async {
  GetStorage().erase();
  await Hive.deleteFromDisk();
}
