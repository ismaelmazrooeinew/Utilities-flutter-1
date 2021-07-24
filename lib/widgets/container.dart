part of '../utilities.dart';

Widget scaffold({
  required Widget body,
  Key? key,
  PreferredSizeWidget? appBar,
  Drawer? drawer,
  Widget? floatingActionButton,
  Widget? bottomNavigationBar,
  EdgeInsets? padding,
  Color? color,
  ImageProvider? backgroundImage,
  bool resizeToAvoidBottomInset = false,
  BoxConstraints? constraints,
}) =>
    GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
            key: key,
            backgroundColor: color,
            appBar: appBar,
            drawer: drawer,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            bottomNavigationBar: bottomNavigationBar,
            body: Container(
              constraints: constraints,
              decoration: backgroundImage != null
                  ? BoxDecoration(
                      image: DecorationImage(image: backgroundImage, fit: BoxFit.cover),
                    )
                  : null,
              padding: padding,
              child: body,
            )));

Widget pullRefresh({
  required RefreshController controller,
  Function? onLoading,
  Function? onRefresh,
  Widget? child,
}) =>
    SmartRefresher(
      controller: controller,
      onLoading: onLoading as void Function()?,
      onRefresh: onRefresh as void Function()?,
      enablePullDown: true,
      enablePullUp: true,
      child: child,
    );

Widget radius({required Widget child, required double radius}) => ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: child,
    );
