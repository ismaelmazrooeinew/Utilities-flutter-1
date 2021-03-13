part of '../../widgets.dart';

void showPicker({
  @required List<String> list,
  @required Function(String selectedItem) action,
  String title = "Select",
  String cancel = "Cancel",
  String confirm = "Confirm",
  double height = 250,
}) =>
    PickerViewPopup.showMode(
      PickerShowMode.BottomSheet,
      controller: PickerController(count: 1, selectedItems: [0]),
      context: context,
      title: Text(title, style: TextStyle(fontSize: 16)),
      cancel: Text(cancel, style: TextStyle(color: Colors.grey)),
      confirm: Text(confirm, style: TextStyle(color: Colors.blue)),
      onConfirm: (controller) => action(list[controller.selectedRowAt(section: 0)]),
      builder: (context, popup) => Container(height: height, child: popup),
      itemExtent: 40,
      numberofRowsAtSection: (section) => list.length,
      itemBuilder: (section, row) => Text(list[row], style: TextStyle(fontSize: 14)),
    );
