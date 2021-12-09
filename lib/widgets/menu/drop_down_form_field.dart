import 'package:flutter/material.dart';

class DropDownField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List<dynamic>? dataSource;
  final String? textField;
  final String? valueField;
  final Function? onChanged;
  final bool filled;
  final EdgeInsets contentPadding;

  DropDownField({
    final Key? key,
    final FormFieldSetter<dynamic>? onSaved,
    final FormFieldValidator<dynamic>? validator,
    final this.titleText = 'Title',
    final this.hintText = 'Select one option',
    final this.required = false,
    final this.errorText = 'Please select one option',
    final this.value,
    final this.dataSource,
    final this.textField,
    final this.valueField,
    final this.onChanged,
    final this.filled = true,
    final this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0),
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: value == '' ? null : value,
          builder: (final FormFieldState<dynamic> state) => SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: contentPadding,
                    labelText: titleText,
                    filled: filled,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<dynamic>(
                      isExpanded: true,
                      hint: Text(hintText, style: TextStyle(color: Colors.grey.shade500)),
                      value: value == '' ? null : value,
                      onChanged: (final dynamic newValue) {
                        state.didChange(newValue);
                        onChanged!(newValue);
                      },
                      items: dataSource!
                          .map((final dynamic item) => DropdownMenuItem<dynamic>(
                                value: item[valueField],
                                child: Text(item[textField], overflow: TextOverflow.ellipsis),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(height: state.hasError ? 5.0 : 0.0),
                Text(state.hasError ? state.errorText! : '', style: TextStyle(color: Colors.redAccent.shade700, fontSize: state.hasError ? 12.0 : 0.0)),
              ],
            ),
          ),
        );
}
