// part of '../utilities.dart';
//
// enum PermissionValue {
//   calendar,
//   camera,
//   contacts,
//   location,
//   locationAlways,
//   locationWhenInUse,
//   mediaLibrary,
//   microphone,
//   phone,
//   photos,
//   photosAddOnly,
//   reminders,
//   sensors,
//   sms,
//   speech,
//   storage,
//   ignoreBatteryOptimizations,
//   notification,
//   accessMediaLocation,
//   activityRecognition,
//   unknown,
//   bluetooth,
//   manageExternalStorage,
//   systemAlertWindow,
//   requestInstallPackages,
//   appTrackingTransparency,
//   criticalAlerts,
//   accessNotificationPolicy,
// }
//
// extension CheckPermission on PermissionValue {
//   Permission get permission {
//     switch (this) {
//       case PermissionValue.storage:
//         return Permission.storage;
//       case PermissionValue.manageExternalStorage:
//         return Permission.manageExternalStorage;
//       default:
//         return Permission.storage;
//     }
//   }
// }
//
// /// for work with device so you need give permission
// /// in Android :
// /// on build.gradle file check compileSdkVersion , minSdkVersion  , targetSdkVersion version
// /// write this method on  AndroidManifest.xml :
// ///    <uses-permission android:name="android.permission.INTERNET"/>
// ///    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
// ///    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
// ///    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/> (after android 11)
// /// and write above <application> => android:requestLegacyExternalStorage="true"
// /// tip :
// ///   after android 11 , change workflow for give permission so give Permission.manageExternalStorage.request()
// /// in IOS :
// /// check url : https://pub.dev/packages/permission_handler
// Future<void> givePermission(PermissionValue permission) async {
//   var status = await permission.permission.status;
//   if (status.isDenied) {
//     await permission.permission.request();
//   }
// }
//
// /// this function for give path and write there
// Future<String> getFilePath({required String folderName, required String fileName}) async {
//   Directory? appDirectory = await _createDeviceDirectory();
//
//   String path = Platform.isIOS
//       ? appDirectory!.path + '/$fileName'
//       : appDirectory!.path.split('Android')[0] + '$folderName/$fileName';
//
//   return path;
// }
//
// Future<Directory?> _createDeviceDirectory() async {
//   Directory? directory = Platform.isAndroid
//       ? await getExternalStorageDirectory()
//       : await getApplicationDocumentsDirectory();
//
//   if (Platform.isAndroid) {
//     directory = Directory(directory!.path.split('Android')[0])..createSync();
//   }
//   return directory;
// }
