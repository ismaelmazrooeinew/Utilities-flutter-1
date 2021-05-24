part of '../utilities.dart';

Future<bool> isConnected() async => await InternetConnectionChecker().hasConnection;
