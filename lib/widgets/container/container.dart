part of '../../widgets.dart';

Widget scaffold({
  @required Widget body,
  AppBar appBar,
  Drawer drawer,
  FloatingActionButton floatingActionButton,
  BottomNavigationBar bottomNavigationBar,
  EdgeInsets padding,
  Color color
}) =>
    GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: color,
        appBar: appBar,
        drawer: drawer,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        bottomNavigationBar: bottomNavigationBar,
        body: Container(padding: padding, child: body),
      ),
    );

Widget listView({
  @required List<Widget> children,
}) =>
    ListView(
      children: children,
      shrinkWrap: true,
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
