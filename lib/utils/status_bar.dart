part of '../utilities.dart';

Future<Color?> statusBarColor() async => await FlutterStatusbarcolor.getStatusBarColor();

Future<Color?> navigationBarColor() async => await FlutterStatusbarcolor.getNavigationBarColor();

void setStatusBarColor(
  Color color, {
  bool animate = false,
}) async =>
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: animate);

void setNavigationBarColor(
  Color color, {
  bool animate = false,
}) async =>
    await FlutterStatusbarcolor.setNavigationBarColor(color, animate: animate);

void setNavigationBarWhiteForeground(
  bool useWhiteForeground,
) async =>
    await FlutterStatusbarcolor.setNavigationBarWhiteForeground(useWhiteForeground);

void setStatusBarWhiteForeground(
  bool useWhiteForeground,
) async =>
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground);
