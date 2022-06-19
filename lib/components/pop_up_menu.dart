import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import '../utilities.dart';
import 'package:flutter/material.dart';

Widget popupMenu({
  required final Widget child,
  required final double width,
  required List<Widget> children,
  final PressType pressType = PressType.singleClick,
  final double verticalMargin = 0,
  final Color arrowColor = Colors.white,
}) {
  final CustomPopupMenuController _customPopupMenuController = CustomPopupMenuController();
  return CustomPopupMenu(
    pressType: pressType,
    verticalMargin: verticalMargin,
    arrowColor: arrowColor,
    arrowSize: 12,
    menuBuilder: () => listOfMenuItems(
      controller: _customPopupMenuController,
      width: width,
      children: children,
    ),
    controller: _customPopupMenuController,
    child: child,
  );
}

Widget popupMenuItem({
  required final Widget title,
  required final Widget icon,
  required final VoidCallback onTap,
  final EdgeInsets contentPadding = const EdgeInsets.only(left: 10, right: 2),
  final double horizontalTitleGap = 4,
  final Key? key,
}) =>
    ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        dense: true,
        contentPadding: contentPadding,
        visualDensity: const VisualDensity(vertical: -2),
        horizontalTitleGap: horizontalTitleGap,
        selected: true,
        leading: icon,
        title: title,
        onTap:onTap);

Widget listOfMenuItems({
  required final CustomPopupMenuController controller,
  required final double width,
  required final List<Widget> children,
  final double borderRadius = 12,
  final double padding = 8,
  final Color color = Colors.white,
}) =>
    radius(
      radius: borderRadius,
      child: column(
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(color: color),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
