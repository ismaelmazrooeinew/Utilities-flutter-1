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

// Future<File?> cropImage({
//   required File file,
//   required Function(File? file) action,
//   CropAspectRatio? cropAspectRatio,
//   CropStyle cropStyle = CropStyle.rectangle,
//   AndroidUiSettings? androidUiSettings,
//   IOSUiSettings? iOSUiSettings,
//   int? maxWidth,
//   int? maxHeight,
//   int compressQuality = 90,
//   List<CropAspectRatioPreset> presets = const [
//     CropAspectRatioPreset.original,
//     CropAspectRatioPreset.square,
//     CropAspectRatioPreset.ratio3x2,
//     CropAspectRatioPreset.ratio4x3,
//     CropAspectRatioPreset.ratio16x9
//   ],
// }) async {
//   final File? result = await ImageCropper.cropImage(
//     sourcePath: file.path,
//     maxWidth: maxWidth,
//     maxHeight: maxHeight,
//     aspectRatio: cropAspectRatio,
//     compressFormat: ImageCompressFormat.png,
//     cropStyle: cropStyle,
//     compressQuality: compressQuality,
//     aspectRatioPresets: presets,
//     androidUiSettings: androidUiSettings ??
//         AndroidUiSettings(
//           toolbarTitle: 'Crop Your Image',
//           showCropGrid: true,
//           hideBottomControls: false,
//           lockAspectRatio: true,
//           initAspectRatio: CropAspectRatioPreset.square,
//           toolbarWidgetColor: Colors.white,
//         ),
//     iosUiSettings: iOSUiSettings ??
//         IOSUiSettings(
//           resetAspectRatioEnabled: false,
//           minimumAspectRatio: 1.0,
//           aspectRatioPickerButtonHidden: true,
//           title: 'Crop Your Image',
//           aspectRatioLockDimensionSwapEnabled: true,
//           aspectRatioLockEnabled: true,
//           hidesNavigationBar: true,
//         ),
//   );
//   action(result);
//   return result;
// }
