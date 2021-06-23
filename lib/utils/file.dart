part of '../utilities.dart';

Future<void> showFilePicker({
  required Function(List<File> file) action,
  FileType fileType = FileType.image,
  bool allowMultiple = false,
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: fileType, allowMultiple: allowMultiple);
  if (result != null) {
    if (allowMultiple) {
      List<File> files = <File>[];
      result.files.forEach((i) {
        if (i.path != null) files.add(File(i.path!));
      });
    } else {
      File file = File(result.files.single.path!);
      action([file]);
    }
  }
}
