part of '../utilities.dart';

showTextFieldDialog({
  @required String title,
  @required String hint,
  @required String okTitle,
  @required String cancelTitle,
  @required action(String text),
}) {
  TextEditingController _controller = TextEditingController();
  dialog(
    AnimatedContainer(
      padding: MediaQuery
          .of(context)
          .viewInsets,
      duration: Duration(milliseconds: 300),
      child: AlertDialog(
        title: Text(title),
        contentPadding: EdgeInsets.all(16),
        content: Row(
          children: <Widget>[
            Expanded(child: TextField(controller: _controller, decoration: InputDecoration(labelText: hint))),
          ],
        ),
        actions: <Widget>[
          Row(
            children: [
              FlatButton(child: Text(cancelTitle), onPressed: () => pop()),
              FlatButton(
                  child: Text(okTitle),
                  onPressed: () {
                    action(_controller.text);
                    _controller.text = "";
                  }),
            ],
          )
        ],
      ),
    ),
    dialog: true,
  );
}
