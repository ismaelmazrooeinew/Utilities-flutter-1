part of '../../widgets.dart';

Widget nothing() => Container(width: 0.1, height: 0.1);

Widget inkWellTransparent({@required Widget child, @required onTap}) => InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: child,
      onTap: onTap,
    );
