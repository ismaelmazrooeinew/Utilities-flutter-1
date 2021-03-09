part of '../../widgets.dart';

/// The cancel actions model that show
/// under the [BottomSheetAction] (grouped separately on iOS).
class CancelAction {
  /// The string that will appear in the title bar of the cancel action. (required)
  final String title;

  /// The callback that is called when the action item is tapped.
  /// [onPressed] is optional by default will dismiss the Action Sheet.
  final VoidCallback onPressed;

  /// The TextStyle to use for the title text. (optional)
  final TextStyle textStyle;

  CancelAction({@required this.title, this.onPressed, this.textStyle});
}

/// The Actions model that will use on the ActionSheet.
class BottomSheetAction {
  /// The string that will appear in the title bar of the action item. (required)
  final String title;

  /// The callback that is called when the action item is tapped. (required)
  final VoidCallback onPressed;

  /// The TextStyle to use for the title text. (optional)
  final TextStyle textStyle;

  BottomSheetAction({@required this.title, @required this.onPressed, this.textStyle})
      : assert(title != null),
        assert(onPressed != null);
}

/// A action bottom sheet that adapts to the platform (Android/iOS).
///
/// [actions] The Actions list that will appear on the ActionSheet. (required)
///
/// [cancelAction] The optional cancel button that show under the
/// actions (grouped separately on iOS).
///
/// [title] The optional title widget that show above the actions.
///
/// The optional [backgroundColor] and [barrierColor] can be passed in to
/// customize the appearance and behavior of persistent bottom sheets.
Future<T> showAdaptiveActionSheet<T>({
  @required BuildContext context,
  Widget title,
  @required List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color barrierColor,
  Color bottomSheetColor,
}) async {
  assert(context != null);
  assert(actions != null);
  assert(barrierColor != Colors.transparent, 'The barrier color cannot be transparent.');

  return _show<T>(context, title, actions, cancelAction, barrierColor, bottomSheetColor);
}

Future<T> _show<T>(
  BuildContext context,
  Widget title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color barrierColor,
  Color bottomSheetColor,
) {
  if (isIos)
    return _showCupertinoBottomSheet(
      context,
      title,
      actions,
      cancelAction,
    );
  else
    return _showMaterialBottomSheet(
      context,
      title,
      actions,
      cancelAction,
      barrierColor,
      bottomSheetColor,
    );
}

Future<T> _showCupertinoBottomSheet<T>(
  BuildContext context,
  Widget title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
) =>
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              title: title,
              actions: actions.map((action) {
                return CupertinoActionSheetAction(
                    onPressed: action.onPressed,
                    child: Text(
                      action.title,
                      style: action.textStyle ?? theme.textTheme.headline6,
                    ));
              }).toList(),
              cancelButton: cancelAction != null
                  ? CupertinoActionSheetAction(
                      onPressed: cancelAction.onPressed ?? () => Navigator.of(context).pop(),
                      child: Text(
                        cancelAction.title,
                        style: cancelAction.textStyle ?? theme.textTheme.headline6.copyWith(color: Colors.lightBlue),
                      ))
                  : null,
            ));

Future<T> _showMaterialBottomSheet<T>(
  BuildContext context,
  Widget title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color barrierColor,
  Color bottomSheetColor,
) =>
    showModalBottomSheet<T>(
        context: context,
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: bottomSheetColor ?? theme.bottomSheetTheme?.modalBackgroundColor ?? theme.bottomSheetTheme?.backgroundColor,
        barrierColor: barrierColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext context) {
          final double screenHeight = MediaQuery.of(context).size.height;
          return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: screenHeight - (screenHeight / 10)),
              child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: <Widget>[
                if (title != null) ...[Padding(padding: const EdgeInsets.all(16.0), child: Center(child: title))],
                ...actions.map<Widget>((action) {
                  return InkWell(
                      onTap: action.onPressed,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            action.title,
                            style: action.textStyle ?? theme.textTheme.headline6,
                            textAlign: TextAlign.center,
                          )));
                }).toList(),
                if (cancelAction != null)
                  InkWell(
                      onTap: cancelAction.onPressed ?? () => Navigator.of(context).pop(),
                      child: Center(
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                cancelAction.title,
                                style: cancelAction.textStyle ?? theme.textTheme.headline6.copyWith(color: Colors.lightBlue),
                              ))))
              ])));
        });
