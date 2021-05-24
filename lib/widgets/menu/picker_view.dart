part of '../../widgets.dart';

void showPicker({
  required List<String> list,
  required Function(String selectedItem) action,
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
      onConfirm: (controller) => action(list[controller.selectedRowAt(section: 0)!]),
      builder: (context, popup) => Container(height: height, child: popup),
      itemExtent: 40,
      numberofRowsAtSection: (section) => list.length,
      itemBuilder: (section, row) => Text(list[row], style: TextStyle(fontSize: 14)),
    );

typedef PickerRowCallBack = int Function(int section);
typedef PickerItemBuilder = Widget Function(int section, int row);
typedef PickerVoidCallBack = void Function(int section, int row);

class PickerView extends StatefulWidget {
  final PickerRowCallBack numberofRowsAtSection;
  final PickerItemBuilder itemBuilder;
  final PickerVoidCallBack? onSelectRowChanged;
  final double? itemExtent;
  final PickerController controller;

  PickerView({
    required this.numberofRowsAtSection,
    required this.itemBuilder,
    required this.controller,
    this.itemExtent = 40,
    this.onSelectRowChanged,
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return PickerViewState();
  }
}

class PickerViewState extends State<PickerView> {
  late PickerController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(PickerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller;
    }
  }

  @override
  void didChangeDependencies() {
    _controller = widget.controller ?? PickerController(count: 0);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(color: Colors.white, child: Row(children: _buildPickers())),
    );
  }

  List<Widget> _buildPickers() {
    List<Widget> children = [];

    for (int section = 0; section < _controller.count; section++) {
      children.add(Expanded(flex: 1, child: _buildPickerItem(section: section)));
    }

    return children;
  }

  Widget _buildPickerItem({required int section}) {
    FixedExtentScrollController scrollController = _controller.scrollControllers[section];

    return Container(
      child: CupertinoPicker.builder(
        backgroundColor: Colors.white,
        scrollController: scrollController,
        diameterRatio: 1,
        itemExtent: widget.itemExtent ?? 40,
        childCount: widget.numberofRowsAtSection(section),
        onSelectedItemChanged: (row) {
          if (widget.onSelectRowChanged != null) {
            widget.onSelectRowChanged!(section, row);
          }
        },
        itemBuilder: (context, row) {
          return Container(alignment: Alignment.center, child: widget.itemBuilder(section, row));
        },
      ),
    );
  }
}

class PickerController {
  final int count;
  final List<FixedExtentScrollController> scrollControllers;

  PickerController({required this.count, List<int>? selectedItems}) : scrollControllers = [] {
    for (int i = 0; i < count; i++) {
      if (selectedItems != null && i < selectedItems.length) {
        scrollControllers.add(FixedExtentScrollController(initialItem: selectedItems[i]));
      } else {
        scrollControllers.add(FixedExtentScrollController());
      }
    }
  }

  void dispose() {
    scrollControllers.forEach((item) {
      item.dispose();
    });
  }

  int? selectedRowAt({required int section}) {
    try {
      FixedExtentScrollController scrollController = scrollControllers[section];
      if (scrollController != null) {
        return scrollController.selectedItem;
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }

  void jumpToRow(int row, {required int atSection}) {
    try {
      if (scrollControllers.length <= atSection) {
        return;
      }
      FixedExtentScrollController scrollController = scrollControllers[atSection];
      scrollController.jumpToItem(row);
    } catch (err) {}
  }

  Future<void> animateToRow(
    int row, {
    required int atSection,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) async {
    try {
      if (scrollControllers.length <= atSection) {
        return;
      }
      FixedExtentScrollController scrollController = scrollControllers[atSection];
      await scrollController.animateToItem(row, duration: duration, curve: curve);
    } catch (err) {}
  }
}

typedef PickerViewBuilder = Widget Function(BuildContext context, PickerViewPopup pickerViewPopup);

enum PickerShowMode { AlertDialog, BottomSheet }

class PickerViewPopup extends StatelessWidget {
  final PickerRowCallBack numberofRowsAtSection;
  final PickerItemBuilder itemBuilder;
  final PickerVoidCallBack? onSelectRowChanged;
  final ValueChanged<PickerController>? onConfirm;
  final VoidCallback? onCancel;
  final PickerController controller;
  final double? itemExtent;
  final Widget? cancel;
  final Widget? confirm;
  final PickerShowMode mode;
  final Widget? title;

  PickerViewPopup._({
    required this.numberofRowsAtSection,
    required this.itemBuilder,
    required this.controller,
    this.mode = PickerShowMode.BottomSheet,
    this.itemExtent,
    this.onSelectRowChanged,
    this.title,
    this.cancel,
    this.onCancel,
    this.confirm,
    this.onConfirm,
  }) : super();

  static Future<T?> showMode<T>(
    PickerShowMode mode, {
    required BuildContext? context,
    required PickerViewBuilder builder,
    required PickerController controller,
    required PickerRowCallBack numberofRowsAtSection,
    required PickerItemBuilder itemBuilder,
    PickerVoidCallBack? onSelectRowChanged,
    double? itemExtent,
    Widget? title,
    Widget? cancel,
    VoidCallback? onCancel,
    Widget? confirm,
    ValueChanged<PickerController>? onConfirm,
  }) {
    PickerViewPopup pickerView = PickerViewPopup._(
      numberofRowsAtSection: numberofRowsAtSection,
      itemBuilder: itemBuilder,
      controller: controller,
      itemExtent: itemExtent,
      onSelectRowChanged: onSelectRowChanged,
      mode: mode,
      title: title,
      cancel: cancel,
      onCancel: () {
        Navigator.of(context!).pop();
        if (onCancel != null) onCancel();
      },
      confirm: confirm,
      onConfirm: (controller) {
        Navigator.of(context!).pop();
        if (onConfirm != null) onConfirm(controller);
      },
    );

    if (mode == PickerShowMode.AlertDialog) {
      return showDialog(
          context: context!,
          builder: (context) {
            return Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), child: builder(context, pickerView));
          });
    } else {
      return showModalBottomSheet(
          context: context!,
          builder: (context) {
            return builder(context, pickerView);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mode == PickerShowMode.AlertDialog) {
      return _buildDialogContent(context);
    } else {
      return _buildBottomSheetContent(context);
    }
  }

  Widget _buildDialogContent(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          color: Colors.white,
          constraints: BoxConstraints.tightFor(height: 280),
          child: Column(
            children: <Widget>[
              Offstage(
                offstage: title == null,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: title,
                ),
              ),
              Expanded(
                child: PickerView(
                  numberofRowsAtSection: numberofRowsAtSection,
                  itemBuilder: itemBuilder,
                  controller: controller,
                  onSelectRowChanged: onSelectRowChanged,
                  itemExtent: itemExtent,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(border: Border(top: BorderSide(color: Theme.of(context).dividerColor))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: _buildInkWellButton(child: cancel ?? Text('取消', style: TextStyle(color: Colors.grey)), onTap: onCancel),
                    ),
                    Container(
                      color: Theme.of(context).dividerColor,
                      width: 1,
                      height: 50,
                    ),
                    Expanded(
                      child: _buildInkWellButton(
                          child: confirm ?? Text('确定', style: TextStyle(color: Theme.of(context).accentColor)),
                          onTap: () {
                            if (onConfirm != null) {
                              onConfirm!(controller);
                            }
                          }),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(height: 280),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildInkWellButton(child: cancel ?? Text('取消', style: TextStyle(color: Colors.grey)), onTap: onCancel),
                Expanded(
                  child: Offstage(
                    offstage: title == null,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: title,
                    ),
                  ),
                ),
                _buildInkWellButton(
                    child: confirm ?? Text('确定', style: TextStyle(color: Theme.of(context).accentColor)),
                    onTap: () {
                      if (onConfirm != null) {
                        onConfirm!(controller);
                      }
                    }),
              ],
            ),
          ),
          Expanded(
            child: PickerView(
              numberofRowsAtSection: numberofRowsAtSection,
              itemBuilder: itemBuilder,
              controller: controller,
              onSelectRowChanged: onSelectRowChanged,
              itemExtent: itemExtent,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInkWellButton({Widget? child, VoidCallback? onTap}) {
    return Material(
        child: Ink(
      color: Colors.white,
      child: InkWell(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: child,
        ),
        onTap: onTap,
      ),
    ));
  }
}
