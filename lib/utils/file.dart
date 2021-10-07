part of '../utilities.dart';

void showFilePicker({
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

/// this function is for pick files on the device. (support all os)
/// please write this function in try-catch and handle the error
/// default value [fileType] is any file
/// default value [dialogTitle] is empty string
/// default value [withData] is false
/// default value [allowMultiple] is false
Future<List<PlatformFile>> filePicker({
  FileType fileType = FileType.any,
  String dialogTitle = "",
  bool withData = false,
  bool allowMultiple = false,
}) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: fileType,
        dialogTitle: dialogTitle,
        withData: withData,
        allowMultiple: allowMultiple);

    if (result != null) {
      return result.files;
    } else {
      throw Exception('File not pick');
    }
  } catch (exception) {
    throw Exception(exception);
  }
}
