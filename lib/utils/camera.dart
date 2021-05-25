part of '../utilities.dart';

/// Add these to info.plist:
/// <key>NSCameraUsageDescription</key>
/// <string>Can I use the camera please?</string>
/// <key>NSMicrophoneUsageDescription</key>
/// <string>Can I use the mic please?</string>
///
/// Android's min sdk version must be 21

/// Add this to main method.
Future<void> initCamera(List<CameraDescription> cameras) async => cameras = await availableCameras();
