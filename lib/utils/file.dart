import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:utilities/utilities.dart';

void showFilePicker({
  required final Function(List<File> file) action,
  final FileType fileType = FileType.image,
  final bool allowMultiple = false,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(type: fileType, allowMultiple: allowMultiple);
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

Future<File?> cropImage({
  required File file,
  Function(File file)? action,
  int? maxWidth,
  int? maxHeight,
  CropAspectRatio cropAspectRatio = const CropAspectRatio(ratioX: 3.0, ratioY: 1.2),
  ImageCompressFormat imageCompressFormat = ImageCompressFormat.png,
  AndroidUiSettings? androidUiSettings,
  IOSUiSettings? iOSUiSettings,
}) async {
  final File? result = await ImageCropper.cropImage(
    sourcePath: file.path,
    maxWidth: maxWidth,
    maxHeight: maxHeight,
    aspectRatio: cropAspectRatio,
    compressFormat: imageCompressFormat,
    cropStyle: CropStyle.rectangle,
    compressQuality: 90,
    androidUiSettings: androidUiSettings ??
        AndroidUiSettings(
          toolbarTitle: 'Crop Your Image',
          showCropGrid: true,
          hideBottomControls: false,
          lockAspectRatio: true,
          initAspectRatio: CropAspectRatioPreset.square,
          activeControlsWidgetColor: context.theme.primaryColor,
          statusBarColor: context.theme.primaryColor,
          toolbarColor: context.theme.primaryColor,
          toolbarWidgetColor: context.theme.cardColor,
        ),
    iosUiSettings: iOSUiSettings ??
        IOSUiSettings(
          resetAspectRatioEnabled: false,
          minimumAspectRatio: 1.0,
          aspectRatioPickerButtonHidden: true,
          title: 'Crop Your Image',
          aspectRatioLockDimensionSwapEnabled: true,
          aspectRatioLockEnabled: true,
          hidesNavigationBar: true,
        ),
  );
  if (action != null) action(result!);
  return result;
}
