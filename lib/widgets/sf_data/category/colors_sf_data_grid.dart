import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:utilities/data/dto/dto.dart';
import 'package:utilities/utilities.dart';
import 'package:utilities/utils/enums.dart';
import 'package:utilities/utils/theme.dart';

class ColorsSfDataGrid2 extends StatefulWidget {
  ColorsSfDataGrid2({required this.lists, required this.columns, required this.onEditTap, required this.onDeleteTap, final Key? key}) : super(key: key);
  List<CategoryReadDto> lists;
  List<GridColumn> columns;
  final Function(CategoryReadDto categoryReadDto) onEditTap;
  final Function(CategoryReadDto categoryReadDto) onDeleteTap;

  @override
  State<ColorsSfDataGrid2> createState() => _ColorsSfDataGrid2State();
}

class _ColorsSfDataGrid2State extends State<ColorsSfDataGrid2> {
  late DataSource2 dataSource;

  @override
  Widget build(final BuildContext context) {
    dataSource = DataSource2(
      widget.lists,
      onEditTap: (categoryReadDto) {
        widget.onEditTap(categoryReadDto);
      },
      onDeleteTap: (categoryReadDto) {
        widget.onDeleteTap(categoryReadDto);
      },
    );
    return SfDataGrid(
      source: dataSource,
      columns: widget.columns,
    );
  }
}

class DataSource2 extends DataGridSource {
  DataSource2(this.lists, {required this.onEditTap, required this.onDeleteTap});

  final List<CategoryReadDto> lists;
  final Function(CategoryReadDto categoryReadDto) onEditTap;
  final Function(CategoryReadDto categoryReadDto) onDeleteTap;

  @override
  List<DataGridRow> get rows => lists
      .mapIndexed<DataGridRow>(
        (final int index, final CategoryReadDto e) => DataGridRow(
          cells: <DataGridCell>[
            DataGridCell<int>(columnName: index.toString(), value: index),
            DataGridCell<CategoryReadDto>(columnName: e.title ?? "", value: e),
            DataGridCell<CategoryReadDto>(columnName: e.titleTr1 ?? "", value: e),
            DataGridCell<CategoryReadDto>(columnName: e.color ?? "", value: e),
            DataGridCell<CategoryReadDto>(columnName: '', value: e),
          ],
        ),
      )
      .toList();

  @override
  DataGridRowAdapter? buildRow(final DataGridRow row) {
    final CategoryReadDto param = row.getCells()[1].value;
    return DataGridRowAdapter(cells: <Widget>[
      Center(child: Text(row.getCells()[0].value.toString())),
      getRow(param.title ?? ''),
      getRow(param.titleTr1 ?? ''),
      getRowColor(param.color ?? '#ff067e19'),
      getEditRow(
        param,
        onEditTap: (categoryReadDto) {
          onEditTap(categoryReadDto);
        },
        onDeleteTap: (categoryReadDto) {
          onDeleteTap(categoryReadDto);
        },
      ),
    ]);
  }

  Widget getCategoryName(final CategoryReadDto? value) {
    final String? profile = value?.media?.getImage(useCase: UseCaseMedia.image.title) != "--" ? value?.media?.getImage(useCase: UseCaseMedia.image.title) : AppIcons.image;
    return Center(
        child: Row(
      children: <Widget>[
        Container(
          width: 32,
          height: 32,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.blueLight,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(child: image(profile ?? AppIcons.image, width: 16, height: 16, color: AppColors.card)),
        ).marginSymmetric(horizontal: 16),
        Text(value?.title ?? '').subtitle1(),
      ],
    ));
  }

  Widget getRow(final String value) => Center(child: Text(value));

  Widget getRowColor(final String value) => Center(
          child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: hexStringToColor(value)),
      ));

  Widget getEditRow(
    final CategoryReadDto? value, {
    required final Function(CategoryReadDto categoryReadDto) onEditTap,
    required final Function(CategoryReadDto categoryReadDto) onDeleteTap,
  }) =>
      Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            child: image(AppIcons.edit2, width: 16, height: 16),
          ).onTap(onEditTap(value!)),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            child: image(AppIcons.trash, width: 16, height: 16),
          ).onTap(onDeleteTap(value)),
        ],
      ));
}
