import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:utilities/utilities.dart';

export 'constants.dart';
export 'extensions/align_extension.dart';
export 'extensions/date_extension.dart';
export 'extensions/extension.dart';
export 'extensions/file_extension.dart';
export 'extensions/iterable_extension.dart';
export 'extensions/number_extension.dart';
export 'extensions/shimmer_extension.dart';
export 'extensions/string_extension.dart';
export 'extensions/text_extension.dart';
export 'extensions/widget_extension.dart';
export 'file.dart';
export 'file_downloader.dart';
export 'get.dart';
export 'dio_interceptor.dart';
export 'launch.dart';
export 'local_storage.dart';
export 'share.dart';

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );

void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
  if (key.currentState!.validate()) action();
}

Future<File> getCompressImageFile({required final File file, final int quality = 70}) async {
  final Directory dir = Directory.systemTemp;
  final String targetPath = "${dir.absolute.path}/temp.jpg";
  final File? result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: quality,
  );

  return result ?? File("--");
}

// void deleteUser() {
//   showYesCancelDialog(
//     title: s.delete,
//     description: s.areYouSureToDeleteThisItem,
//     onYesButtonTap: () {
//       showLoading();
//       final UserDataSource userDataSource = UserDataSource(baseUrl: AppConstants.baseUrl);
//       userDataSource.delete(
//         id: userReadDto.id ?? "",
//         onResponse: (final GenericResponse<dynamic> response) {
//           dismissLoading();
//           setState(() {});
//         },
//         onError: (final GenericResponse<dynamic> errorResponse) {
//           dismissLoading();
//           setState(() {});
//         },
//       );
//       back();
//     },
//   );
// }

Widget button({
  required final VoidCallback onTap,
  final String title = "",
  final EdgeInsets margin = EdgeInsets.zero,
  final EdgeInsets padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
  final Widget trailing = const SizedBox(),
  final Widget leading = const SizedBox(),
  final double width = 150,
  final double height = 50,
  final Widget? titleWidget,
  final Color? backgroundColor,
  final double? borderRadius = 10,
  final TextStyle? textStyle,
  final bool maxWidth = false,
  final Color? borderColor,
  final Color? titleColor,
}) =>
    Container(
      width: maxWidth ? Get.width : width,
      height: height,
      padding: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: borderRadius == null
              ? null
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius), side: BorderSide(color: borderColor ?? Colors.transparent)),
                ),
        ),
        child: row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            leading,
            titleWidget ?? Text(title, style: textStyle?.copyWith(color: titleColor ?? Colors.white) ?? context.textTheme.headline6!.copyWith(color: titleColor ?? Colors.white)),
            trailing,
          ],
        ),
      ),
    );

void showYesCancelDialog({
  required final String title,
  required final String description,
  required final String yesButtonTitle,
  required final String cancelButtonTitle,
  required final VoidCallback onYesButtonTap,
  required final VoidCallback onCancelButtonTap,
}) =>
    showDialog(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title, style: context.textTheme.headline4),
        content: Text(description, style: context.textTheme.bodyText1),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          button(onTap: onCancelButtonTap, title: cancelButtonTitle, width: 80),
          const SizedBox(width: 12),
          button(onTap: onYesButtonTap, title: yesButtonTitle, width: 80),
        ],
      ),
    );

Color hexStringToColor(final String hexString) {
  if (hexString.isEmpty) return Colors.transparent;
  final StringBuffer buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String stringToHexColor(final Color color) => '#${color.value.toRadixString(16)}';
