part of '../utilities.dart';

AppBar appbarNoColor({Widget? title}) => AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      title: title,
    );
