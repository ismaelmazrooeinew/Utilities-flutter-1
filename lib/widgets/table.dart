part of '../widgets.dart';

Widget tableHeader({@required List<Widget> cells}) => Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Row(
        children: cells
            .mapIndexed(
              (int index, item) => Expanded(child: Container(alignment: Alignment.center, child: cells[index])),
            )
            .toList()));

Widget tableRowCard({@required List<Widget> cells}) => Card(
    elevation: 5,
    child: Container(
        height: 50,
        child: Stack(children: [
          Row(children: cells.map((text) => Expanded(child: Container(alignment: Alignment.center, child: text))).toList()),
        ])));
