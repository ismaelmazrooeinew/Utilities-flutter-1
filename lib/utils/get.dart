import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

/// needs to be implemented https://pub.dev/packages/get
/// needs to be implemented https://pub.dev/packages/get_storage

bool isAndroid = GetPlatform.isAndroid;
bool isIos = GetPlatform.isIOS;
bool isMacOs = GetPlatform.isMacOS;
bool isWindows = GetPlatform.isWindows;
bool isLinux = GetPlatform.isLinux;
bool isFuchsia = GetPlatform.isFuchsia;
bool isMobile = GetPlatform.isMobile;
bool isWeb = GetPlatform.isWeb;
bool isDesktop = GetPlatform.isDesktop;
bool isLandScape = Get.context!.isLandscape;
bool isPortrait = Get.context!.isPortrait;
bool isTablet = Get.context!.isTablet;
bool isPhone = Get.context!.isPhone;
BuildContext context = Get.context!;
double screenHeight = Get.height;
double screenWidth = Get.width;
ThemeData theme = Get.context!.theme;
TextTheme textTheme = Get.context!.textTheme;
Locale? currentLocale = Get.locale;
bool isDebugMode = kDebugMode;

void updateLocale(final Locale locale) => Get.updateLocale(locale);

Future<String> appName() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.appName;
}

Future<String> appPackageName() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
}

Future<String> appVersion() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<String> appBuildNumber() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.buildNumber;
}

void push(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final bool backFirst = false,
}) {
  if (backFirst) back();
  Get.to(
    page,
    fullscreenDialog: dialog,
    popGesture: true,
    opaque: dialog ? false : true,
    transition: transition,
  );
}

void dialog(
  final Widget page, {
  final bool dialog = false,
  final VoidCallback? onDismiss,
}) =>
    Get.dialog(page, useSafeArea: true).then(
      (final _) => onDismiss != null ? onDismiss() : null,
    );

void back() => Get.back();

void offAll(final Widget page) => Get.offAll(page);

void off(final Widget page) => Get.off(page);
