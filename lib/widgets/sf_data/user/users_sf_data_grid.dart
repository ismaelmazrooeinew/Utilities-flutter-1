import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:utilities/data/dto/dto.dart';
import 'package:utilities/utilities.dart';
import 'package:utilities/utils/enums.dart';

class UsersSfDataGrid2 extends StatefulWidget {
  UsersSfDataGrid2({required this.lists, required this.columns, required this.onEditTap, required this.onDeleteTap, final Key? key}) : super(key: key);
  List<UserReadDto> lists;
  List<GridColumn> columns;
  final Function(UserReadDto userReadDto) onEditTap;
  final Function(UserReadDto userReadDto) onDeleteTap;

  @override
  State<UsersSfDataGrid2> createState() => _UsersSfDataGrid2State();
}

class _UsersSfDataGrid2State extends State<UsersSfDataGrid2> {
  late DataSource2 dataSource;

  @override
  Widget build(final BuildContext context) {
    dataSource = DataSource2(
      widget.lists,
      onEditTap: (userReadDto) {
        widget.onEditTap(userReadDto);
      },
      onDeleteTap: (userReadDto) {
        widget.onDeleteTap(userReadDto);
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

  final List<UserReadDto> lists;
  final Function(UserReadDto userReadDto) onEditTap;
  final Function(UserReadDto userReadDto) onDeleteTap;

  @override
  List<DataGridRow> get rows => lists
      .mapIndexed<DataGridRow>(
        (final int index, final UserReadDto e) => DataGridRow(
          cells: <DataGridCell>[
            DataGridCell<int>(columnName: index.toString(), value: index),
            DataGridCell<UserReadDto>(columnName: e.userName ?? "", value: e),
            DataGridCell<UserReadDto>(columnName: e.phoneNumber ?? "", value: e),
            DataGridCell<UserReadDto>(columnName: e.appEmail ?? "", value: e),
            DataGridCell<UserReadDto>(columnName: e.region ?? "", value: e),
            DataGridCell<UserReadDto>(columnName: '', value: e),
          ],
        ),
      )
      .toList();

  @override
  DataGridRowAdapter? buildRow(final DataGridRow row) {
    final UserReadDto param = row.getCells()[1].value;
    return DataGridRowAdapter(cells: <Widget>[
      Center(child: Text(row.getCells()[0].value.toString())),
      getRowUserTitle(value: param, imageUseCase: UseCaseMedia.profile.title),
      getRow((row.getCells()[1].value as UserReadDto).phoneNumber ?? ''),
      getRow((row.getCells()[1].value as UserReadDto).appEmail ?? ''),
      getRow((row.getCells()[1].value as UserReadDto).region ?? ''),
      getRowUserEdit(
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
}
