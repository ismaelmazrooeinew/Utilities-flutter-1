part of '../utilities.dart';

showTextFieldDialog({
  String title = "",
  String hint = "",
  String okTitle = "OK",
  String cancelTitle = "Cancel",
  TextInputType type = TextInputType.text,
  required action(String text),
}) {
  TextEditingController _controller = TextEditingController();
  dialog(
      AnimatedContainer(
          padding: MediaQuery.of(context).viewInsets,
          duration: Duration(milliseconds: 300),
          child: AlertDialog(
              title: Text(title),
              contentPadding: EdgeInsets.all(16),
              content: Row(children: <Widget>[
                Expanded(child: TextField(controller: _controller, decoration: InputDecoration(labelText: hint), keyboardType: type)),
              ]),
              actions: <Widget>[
                Row(children: [
                  TextButton(child: Text(cancelTitle), onPressed: () => pop()),
                  TextButton(
                      child: Text(okTitle),
                      onPressed: () {
                        action(_controller.text);
                        _controller.text = "";
                      })
                ])
              ])),
      dialog: true);
}
