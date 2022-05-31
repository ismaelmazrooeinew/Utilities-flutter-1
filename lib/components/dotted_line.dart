import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({final Key? key, this.height = 1, this.color = Colors.black}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final BuildContext context, final BoxConstraints constraints) {
          final double boxWidth = constraints.constrainWidth();
          const double dashWidth = 10;
          final double dashHeight = height;
          final int dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              dashCount,
              (final _) => SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(decoration: BoxDecoration(color: color)),
              ),
            ),
          );
        },
      );
}