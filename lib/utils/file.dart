part of '../utilities.dart';

showFilePicker({
  @required Function(File file) action,
  FileType fileType = FileType.image,
}) async {
  FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    File file = File(result.files.single.path);
    action(file);
  }
}
