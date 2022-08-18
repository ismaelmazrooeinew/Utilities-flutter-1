import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:utilities/utilities.dart';

void toast(String param) {
  if (param != "") {
    Fluttertoast.showToast(msg: param, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, fontSize: 16.0);
  }

void showMessage({
  required final Function(List<File> file) action,
  final FileType fileType = FileType.image,
  final bool allowMultiple = false,
  final List<String>? allowedExtensions,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: allowMultiple,
    allowedExtensions: allowedExtensions,
  );
  if (result != null) {
    if (allowMultiple) {
      final List<File> files = <File>[];
      result.files.forEach((final PlatformFile i) {
        if (i.path != null) files.add(File(i.path!));
      });
    } else {
      final File file = File(result.files.single.path!);
      action(<File>[file]);
    }
  }
}
