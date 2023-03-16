import 'dart:io';
import 'package:utilities/utilities.dart';

void showFilePicker({
  required final Function(List<File> file) action,
  final FileType fileType = FileType.image,
  final bool allowMultiple = false,
  String? initialDirectory,
  String? dialogTitle,
  bool allowCompression = true,
  bool withData = false,
  bool withReadStream = false,
  bool lockParentWindow = false,
  final List<String>? allowedExtensions,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    dialogTitle: dialogTitle,
    initialDirectory: initialDirectory,
    allowCompression: allowCompression,
    withData: withData,
    withReadStream: withReadStream,
    lockParentWindow: lockParentWindow,
    allowMultiple: allowMultiple,
    allowedExtensions: allowedExtensions,
  );

  if (result != null) {
    if (allowMultiple) {
      final List<File> files = <File>[];
      result.files.forEach((final PlatformFile i) {
        if (i.path != null) files.add(File(i.path!));
      });
      action(files);
    } else {
      File file = File("--");
      if (result.files.single.path != null) {
        file = File(result.files.single.path!);
      }
      action(<File>[file]);
    }
  }
}

void showMultiFilePicker({
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

void showFilePickerWeb({
  required final Function(PlatformFile file) action,
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
    PlatformFile file = await result.files[0];
    action(file);
  }
}

Future<CroppedFile?> cropImage({
  required final File file,
  final Function(CroppedFile file)? action,
  final int? maxWidth,
  final int? maxHeight,
  final CropStyle cropStyle = CropStyle.rectangle,
  final CropAspectRatio cropAspectRatio = const CropAspectRatio(ratioX: 3, ratioY: 1.2),
  final ImageCompressFormat imageCompressFormat = ImageCompressFormat.png,
  final AndroidUiSettings? androidUiSettings,
  final WebUiSettings? webUiSettings,
  final IOSUiSettings? iOSUiSettings,
  final List<CropAspectRatioPreset> aspectRatioPresets = const <CropAspectRatioPreset>[
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
  ],
}) async {
  final CroppedFile? result = await ImageCropper().cropImage(
    sourcePath: file.path,
    maxWidth: maxWidth,
    maxHeight: maxHeight,
    aspectRatio: cropAspectRatio,
    compressFormat: imageCompressFormat,
    cropStyle: cropStyle,
    aspectRatioPresets: aspectRatioPresets,
    uiSettings: <PlatformUiSettings>[
      androidUiSettings ??
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
      iOSUiSettings ??
          IOSUiSettings(
            resetAspectRatioEnabled: false,
            minimumAspectRatio: 1,
            aspectRatioPickerButtonHidden: true,
            title: 'Crop Your Image',
            aspectRatioLockDimensionSwapEnabled: true,
            aspectRatioLockEnabled: true,
            hidesNavigationBar: true,
          ),
      webUiSettings ??
          WebUiSettings(
            context: context,
            enableZoom: true,
            enableResize: true,
            showZoomer: true,
            barrierColor: context.theme.primaryColor,
          ),
    ],
  );
  if (action != null) action(result!);
  return result;
}
