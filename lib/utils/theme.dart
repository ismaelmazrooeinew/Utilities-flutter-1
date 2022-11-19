import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static OutlineInputBorder textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: AppColors.divider),
  );


  static OutlineInputBorder searchFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: AppColors.divider),
  );

}

class AppColors {
  static const Color primary = Color(0xffEE3B34);
  static const Color primaryLight = Color(0xffA78227);
  static const Color primaryDark = Color(0xff000000);
  static const Color highlight = Color(0xffEE3B34);
  static const Color disabled = Color(0xff949FB2);
  static const Color divider = Color(0xffEBD2CD);
  static const Color background = Color(0xffffffff);
  static const Color indicator = Color(0xffF3E8E7);
  static const Color hint = Color(0xffA78227);
  static const Color shadow = Color(0xfffcf2f2);
  static const Color card = Color(0xffffffff);
  static const Color hover = Color(0xffFFF6E5);
  static const Color error = Color(0xffF04F6C);
  static const Color focus = Color(0xff00D6A4);
  static const Color blueLight = Color(0xff64b5f6);

  static const Color success = Color.fromRGBO(118, 201, 63, 1);
  static const Color transparent = Colors.transparent;
  static const Color yellow = Color.fromRGBO(226, 182, 6, 1);
  static const Color orange = Color.fromRGBO(229, 122, 0, 1);
  static const Color red = Color.fromRGBO(245, 64, 64, 1);
  static const Color pink = Color.fromRGBO(252, 81, 133, 1);
  static const Color purple = Color.fromRGBO(230, 96, 208, 1);
  static const Color darkPurple = Color.fromRGBO(102, 106, 245, 1);
  static const Color blue = Color.fromRGBO(7, 148, 255, 1);
  static const Color lightBlue = Color.fromRGBO(33, 222, 215, 1);
  static const Color green = Color.fromRGBO(40, 214, 40, 1);
  static const Color blueGray = Color.fromRGBO(122, 143, 166, 1);
  static const Color grey = Color.fromRGBO(177, 191, 208, 1);
  static const Color lightGrey = Color.fromRGBO(238, 238, 238, 1);
  static const Color gold = Color.fromRGBO(219, 180, 77, 1);
  static const Color profileCard = Color.fromRGBO(242, 245, 248, 1);
  static const Color verifiedSymbolColor = Color(0xff24bdba);


}

class AppThemes {
  static const TextStyle lightBaseTextStyle = TextStyle(color: AppColors.primaryDark, height: 1.5);
  static final ThemeData lightTheme = ThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    dividerColor: AppColors.divider,
    primaryColor: AppColors.primary,
    focusColor: AppColors.focus,
    errorColor: AppColors.error,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    highlightColor: AppColors.indicator,
    splashColor: AppColors.indicator,
    disabledColor: AppColors.disabled,
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    shadowColor: AppColors.shadow,
    hoverColor: AppColors.hover,
    cardColor: AppColors.card,
    hintColor: AppColors.hint,
    indicatorColor: AppColors.indicator,
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: AppColors.divider, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.dark),
    textTheme: TextTheme(
      headline1: lightBaseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      headline2: lightBaseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      headline3: lightBaseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      headline4: lightBaseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      headline5: lightBaseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      headline6: lightBaseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      subtitle1: lightBaseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      subtitle2: lightBaseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      bodyText1: lightBaseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      bodyText2: lightBaseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.primaryDark,fontFamily: 'IRANSansMobile'),
      caption: lightBaseTextStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.hint,fontFamily: 'IRANSansMobile'),
      overline: lightBaseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, decoration: TextDecoration.underline, color: AppColors.primary,fontFamily: 'IRANSansMobile'),
      button: lightBaseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary,fontFamily: 'IRANSansMobile'),
    ),
    iconTheme: const IconThemeData(color: AppColors.primary),
    cardTheme: CardTheme(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      color: AppColors.card,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 12)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 1, horizontal: 1)),
        textStyle: MaterialStateProperty.all(const TextStyle(color: AppColors.primaryDark)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(const BorderSide(color: AppColors.primary, width: 2)),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 12)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 8,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: AppColors.background,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      selectedLabelStyle: TextStyle(color: AppColors.primary),
      unselectedLabelStyle: TextStyle(color: AppColors.disabled),
    ),
    expansionTileTheme: const ExpansionTileThemeData(tilePadding: EdgeInsets.zero),
  );
}

class AppImages {
  static const String _base = "lib/assets/images";
  static const String shapeLogIn = "$_base/shape_log_in.png";
  static const String slider = "$_base/slider.svg";
  static const String backImage = "$_base/back_image.jpg";
}

class AppIcons {
  static const String _base = "lib/assets/icons";
  // static const String close = "$_base/close.svg";
  static const String profile = "$_base/profile.svg";
  // static const String arrowRight = "$_base/arrow_right.svg";
  // static const String email = "$_base/email.svg";
  // static const String expansionArrow = "$_base/expansion_arrow.svg";
  static const String image = "$_base/image.svg";
  // static const String singlePost = "$_base/single_post.svg";
  // static const String whatsapp = "$_base/whatsapp.svg";
  // static const String success = "$_base/success.svg";
  // static const String warning = "$_base/warning.svg";
  static const String edit2 = "$_base/edit2.svg";
  static const String trash = "$_base/trash.svg";
  // static const String info = "$_base/info.svg";
  // static const String woman = "$_base/woman.svg";
  // static const String man = "$_base/man.svg";
  // static const String team = "$_base/team.svg";
  // static const String company = "$_base/company.svg";
  // static const String culture = "$_base/culture.svg";
  // static const String union = "$_base/union.svg";
  // static const String ngo = "$_base/ngo.svg";
  // static const String closeCircleRed = "$_base/close_circle_red.svg";
  // static const String tickCircleGreen = "$_base/tick_circle_green.svg";
  // static const String search = "$_base/search.svg";
  //


}
