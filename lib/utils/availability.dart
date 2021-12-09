part of '../utilities.dart';

Future<bool> isConnected() async => InternetConnectionChecker().hasConnection;
