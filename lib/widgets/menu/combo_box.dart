part of '../../widgets.dart';

class ComboBox extends StatefulWidget {
  final String initialValue;
  final List<String> items;
  final Function(int index, String name) onChange;

  ComboBox({
    @required this.initialValue,
    @required this.items,
    this.onChange,
  });

  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  String comboBoxValue;

  @override
  void initState() {
    super.initState();
    comboBoxValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => Container(
      child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: DropdownButton(
              underline: Container(),
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, size: 32),
              value: comboBoxValue,
              items: widget.items
                  .map<DropdownMenuItem<String>>(
                    (value) => DropdownMenuItem<String>(value: value, child: Padding(padding: EdgeInsets.all(10), child: Text(value))),
                  )
                  .toList(),
              dropdownColor: Colors.white,
              onChanged: (String value) {
                setState(() => comboBoxValue = value);
                widget.onChange(widget.items.indexOf(value), value);
              })));
}
