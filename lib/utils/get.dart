import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:utilities/utilities.dart';

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

Future<void> push(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final bool backFirst = false,
  final bool preventDuplicates = true,
  final int milliSecondDelay = 1,
}) async {
  if (backFirst) back();
  final Widget _page = await Future.microtask(() => page);
  delay(
    milliSecondDelay,
    () => Get.to(
      _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
      preventDuplicates: preventDuplicates,
    ),
  );
}

Future<void> dialog(
  final Widget page, {
  final bool dialog = false,
  final VoidCallback? onDismiss,
}) async {
  final Widget _page = await Future.microtask(() => page);

  Get.dialog(_page, useSafeArea: true).then(
    (final _) => onDismiss != null ? onDismiss() : null,
  );
}

Future<void> offAll(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final int milliSecondDelay = 1,
}) async {
  final Widget _page = await Future.microtask(() => page);
  delay(
    milliSecondDelay,
    () => Get.offAll(
      _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
    ),
  );
}

void off(final Widget page) => Get.off(page);

void back() => Get.back();

Future<void> showEasyLoading() => EasyLoading.show();

Future<void> dismissEasyLoading() => EasyLoading.dismiss();

Future<void> showEasyError() => EasyLoading.showError("");

bool isEasyLoadingShow() => EasyLoading.isShow;

void snackbarGreen({
  required final String title,
  required final String subtitle,
  required final SnackPosition? snackPosition,
  required final Widget? titleText,
  required final Widget? messageText,
  required final Widget? icon,
  required final bool? shouldIconPulse,
  required final double? maxWidth,
  required final EdgeInsets? margin,
  required final EdgeInsets? padding,
  required final double? borderRadius,
  required final Color? borderColor,
  required final double? borderWidth,
  required final Color? backgroundColor,
  required final Color? leftBarIndicatorColor,
  required final List<BoxShadow>? boxShadows,
  required final Gradient? backgroundGradient,
  required final TextButton? mainButton,
  required final OnTap? onTap,
  required final bool? isDismissible,
  required final bool? showProgressIndicator,
  required final DismissDirection? dismissDirection,
  required final AnimationController? progressIndicatorController,
  required final Color? progressIndicatorBackgroundColor,
  required final Animation<Color>? progressIndicatorValueColor,
  required final SnackStyle? snackStyle,
  required final Curve? forwardAnimationCurve,
  required final Curve? reverseAnimationCurve,
  required final Duration? animationDuration,
  required final double? barBlur,
  required final double? overlayBlur,
  required final SnackbarStatusCallback? snackbarStatus,
  required final Color? overlayColor,
  required final Form? userInputForm,
  required final Color? colorText,
  final Duration? duration = const Duration(seconds: 3),
  final bool instantInit = true,
}) =>
    Get.snackbar(
      title,
      subtitle,
      backgroundColor: backgroundColor ?? Colors.green,
      colorText: colorText ?? Colors.white,
      maxWidth: maxWidth,
      onTap: onTap,
      margin: margin,
      borderRadius: borderRadius,
      snackPosition: snackPosition,
      padding: padding,
      animationDuration: animationDuration,
      backgroundGradient: backgroundGradient,
      barBlur: barBlur,
      borderColor: borderColor,
      borderWidth: borderWidth,
      boxShadows: boxShadows,
      dismissDirection: dismissDirection,
      duration: duration,
      forwardAnimationCurve: forwardAnimationCurve,
      icon: icon,
      instantInit: instantInit,
      isDismissible: isDismissible,
      leftBarIndicatorColor: leftBarIndicatorColor,
      mainButton: mainButton,
      messageText: messageText,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorValueColor: progressIndicatorValueColor,
      reverseAnimationCurve: reverseAnimationCurve,
      shouldIconPulse: shouldIconPulse,
      showProgressIndicator: showProgressIndicator,
      snackbarStatus: snackbarStatus,
      snackStyle: snackStyle,
      titleText: titleText,
      userInputForm: userInputForm,
    );

void snackbarRed({
  required final String title,
  required final String subtitle,
  required final SnackPosition? snackPosition,
  required final Widget? titleText,
  required final Widget? messageText,
  required final Widget? icon,
  required final bool? shouldIconPulse,
  required final double? maxWidth,
  required final EdgeInsets? margin,
  required final EdgeInsets? padding,
  required final double? borderRadius,
  required final Color? borderColor,
  required final double? borderWidth,
  required final Color? backgroundColor,
  required final Color? leftBarIndicatorColor,
  required final List<BoxShadow>? boxShadows,
  required final Gradient? backgroundGradient,
  required final TextButton? mainButton,
  required final OnTap? onTap,
  required final bool? isDismissible,
  required final bool? showProgressIndicator,
  required final DismissDirection? dismissDirection,
  required final AnimationController? progressIndicatorController,
  required final Color? progressIndicatorBackgroundColor,
  required final Animation<Color>? progressIndicatorValueColor,
  required final SnackStyle? snackStyle,
  required final Curve? forwardAnimationCurve,
  required final Curve? reverseAnimationCurve,
  required final Duration? animationDuration,
  required final double? barBlur,
  required final double? overlayBlur,
  required final SnackbarStatusCallback? snackbarStatus,
  required final Color? overlayColor,
  required final Form? userInputForm,
  required final Color? colorText,
  final Duration? duration = const Duration(seconds: 3),
  final bool instantInit = true,
}) =>
    Get.snackbar(
      title,
      subtitle,
      backgroundColor: backgroundColor ?? Colors.red,
      colorText: colorText ?? Colors.white,
      maxWidth: maxWidth,
      onTap: onTap,
      margin: margin,
      borderRadius: borderRadius,
      snackPosition: snackPosition,
      padding: padding,
      animationDuration: animationDuration,
      backgroundGradient: backgroundGradient,
      barBlur: barBlur,
      borderColor: borderColor,
      borderWidth: borderWidth,
      boxShadows: boxShadows,
      dismissDirection: dismissDirection,
      duration: duration,
      forwardAnimationCurve: forwardAnimationCurve,
      icon: icon,
      instantInit: instantInit,
      isDismissible: isDismissible,
      leftBarIndicatorColor: leftBarIndicatorColor,
      mainButton: mainButton,
      messageText: messageText,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorValueColor: progressIndicatorValueColor,
      reverseAnimationCurve: reverseAnimationCurve,
      shouldIconPulse: shouldIconPulse,
      showProgressIndicator: showProgressIndicator,
      snackbarStatus: snackbarStatus,
      snackStyle: snackStyle,
      titleText: titleText,
      userInputForm: userInputForm,
    );
