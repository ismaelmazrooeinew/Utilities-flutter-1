part of '../widgets.dart';

Widget scaffold({
  @required Widget body,
  AppBar appBar,
  Drawer drawer,
  FloatingActionButton floatingActionButton,
  BottomNavigationBar bottomNavigationBar,
  EdgeInsets padding,
  Color color,
  ImageProvider backgroundImage,
  bool resizeToAvoidBottomInset = false,
}) =>
    GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
            backgroundColor: color,
            appBar: appBar,
            drawer: drawer,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
            bottomNavigationBar: bottomNavigationBar,
            body: Container(
              decoration: backgroundImage != null ? BoxDecoration(image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)) : null,
              padding: padding,
              child: body,
            )));

Widget listView({
  @required List<Widget> children,
  ScrollPhysics physics,
}) =>
    ListView(
      children: children,
      shrinkWrap: true,
      physics: physics,
    );

Widget gridView({
  @required List<Widget> children,
  ScrollPhysics physics,
  int crossAxisCount = 2,
}) =>
    GridView.count(
      children: children,
      shrinkWrap: true,
      physics: physics,
      crossAxisCount: crossAxisCount,
    );

Widget listViewBuilder({
  @required int itemCount,
  @required IndexedWidgetBuilder itemBuilder,
  ScrollPhysics physics,
}) =>
    ListView.builder(
      physics: physics,
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    );

Widget gridViewBuilder({
  @required int itemCount,
  @required IndexedWidgetBuilder itemBuilder,
  @required SliverGridDelegate delegate,
  ScrollPhysics physics,
}) =>
    GridView.builder(
      physics: physics,
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      gridDelegate: delegate,
    );

Widget pullRefresh({
  @required RefreshController controller,
  Function onLoading,
  Function onRefresh,
  Widget child,
}) =>
    SmartRefresher(
      controller: controller,
      onLoading: onLoading,
      onRefresh: onRefresh,
      enablePullDown: true,
      enablePullUp: true,
      child: child,
    );

Widget radius({@required Widget child, @required double radius}) => ClipRRect(borderRadius: BorderRadius.circular(radius), child: child);
