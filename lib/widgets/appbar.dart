part of '../utilities.dart';

AppBar appbarTransparent({Widget? title}) => AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      title: title,
    );
