part of '../utilities.dart';

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

void updateLocale(Locale locale) => Get.updateLocale(locale);

Future<String> appName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.appName;
}

Future<String> appPackageName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
}

Future<String> appVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<String> appBuildNumber() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.buildNumber;
}

void push(Widget page, {bool dialog = false, Transition transition = Transition.cupertino, bool popFirst = false}) {
  if (popFirst) {
    pop();
  }
  Get.to(
    page,
    fullscreenDialog: dialog,
    popGesture: true,
    opaque: dialog ? false : true,
    transition: transition,
  );
}

void dialog(
  Widget page, {
  bool dialog = false,
  onDismiss,
}) =>
    Get.dialog(page, useSafeArea: true).then((value) => onDismiss != null ? onDismiss() : null);

void pop() => Get.back();

void pushAndRemoveUntil(Widget page) => Get.offAll(page);

class UtilitiesGet {
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

  void updateLocale(Locale locale) => Get.updateLocale(locale);

  Future<String> appName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  Future<String> appPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  Future<String> appVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> appBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  void push(Widget page, {bool dialog = false, Transition transition = Transition.cupertino, bool popFirst = false}) {
    if (popFirst) {
      pop();
    }
    Get.to(
      page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
    );
  }

  void dialog(Widget page, {bool dialog = false, onDismiss}) => Get.dialog(page, useSafeArea: true).then((value) => onDismiss != null ? onDismiss() : null);

  void pop() => Get.back();

  void pushAndRemoveUntil(Widget page) => Get.offAll(page);
}
