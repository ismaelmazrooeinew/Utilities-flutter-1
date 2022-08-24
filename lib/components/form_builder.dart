import 'dart:io';

import 'package:flutter/material.dart';
import 'package:utilities/data/dto/form_filed.dart';
import 'package:utilities/utilities.dart';

class FormBuilder extends StatefulWidget {
  const FormBuilder({
    required this.formFields,
    required this.onFormChanged,
    this.isScrollable = false,
    this.textFieldFillColor = Colors.transparent,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.groupButtonOptions,
    this.uploadFileWidget,
    this.selectedFileWidget,
    this.uploadImageWidget,
    this.labelStyle,
    this.spaceBetween,
    this.textFieldPadding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    this.requiredText = "* This field is required",
    final Key? key,
  }) : super(key: key);
  final List<FormFieldReadDto> formFields;
  final Function(List<FormReadDto> forms) onFormChanged;
  final bool isScrollable;
  final Color textFieldFillColor;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final GroupButtonOptions? groupButtonOptions;
  final Widget? uploadFileWidget;
  final Widget? uploadImageWidget;
  final Widget? selectedFileWidget;
  final TextStyle? labelStyle;
  final double? spaceBetween;
  final EdgeInsets textFieldPadding;
  final String requiredText;

  @override
  _FormBuilderState createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  List<FormReadDto> forms = <FormReadDto>[];

  @override
  Widget build(final BuildContext context) => column(
        isScrollable: widget.isScrollable,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.formFields.map((final FormFieldReadDto field) {
          switch (field.type) {
            case 0:
              return _textField(field: field).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 1:
              return _textField(field: field, maxLine: 5).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 2:
              return _groupButton(field: field).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 3:
              return _groupButton(field: field).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 4:
              return _radio(field: field).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 5:
              return _textField(field: field).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 6:
              return _filePicker(field: field).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 7:
              return _imagePicker(field: field).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            default:
              return const SizedBox();
          }
        }).toList(),
      );

  Widget _filePicker({required final FormFieldReadDto field}) {
    File selectedFile = File("");
    return StatefulBuilder(
      builder: (final _, final StateSetter setter) => iconTextVertical(
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: selectedFile == File("")
            ? GestureDetector(
                onTap: () => showFilePicker(action: (final List<File> files) => selectedFile = files.first),
                child: widget.uploadFileWidget ?? const Icon(Icons.add_circle, size: 30),
              )
            : Stack(
                children: <Widget>[
                  widget.selectedFileWidget ?? const Icon(Icons.file_copy, size: 30),
                  const Icon(Icons.clear, size: 15).onTap(() => setter(() => selectedFile = File(""))),
                ],
              ),
      ),
    );
  }

  Widget _imagePicker({required final FormFieldReadDto field}) {
    File selectedFile = File("");
    return StatefulBuilder(
      builder: (final _, final StateSetter setter) => iconTextVertical(
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: selectedFile == File("")
            ? GestureDetector(
                onTap: () => showFilePicker(action: (final List<File> files) => selectedFile = files.first),
                child: widget.uploadImageWidget ?? const Icon(Icons.add_circle, size: 30),
              )
            : Stack(
                children: <Widget>[
                  imageFile(selectedFile, width: 70, height: 70, borderRadius: 7),
                  const Icon(Icons.clear, size: 15).onTap(() => setter(() => selectedFile = File(""))),
                ],
              ),
      ),
    );
  }

  Widget _radio({required final FormFieldReadDto field}) {
    final RxBool radioValue = false.obs;
    return Obx(
      () => iconTextHorizontal(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: Checkbox(
          value: radioValue.value,
          onChanged: (final bool? value) {
            radioValue.value = value!;
            if (radioValue.value) {
              forms.removeWhere((final FormReadDto e) => e.id == field.id);
              forms.add(FormReadDto(id: field.id, title: "true"));
            } else {
              forms.removeWhere((final FormReadDto e) => e.id == field.id);
              forms.add(FormReadDto(id: field.id, title: "false"));
            }
          },
        ),
      ),
    );
  }

  Widget _groupButton({required final FormFieldReadDto field}) {
    final GroupButtonController controller = GroupButtonController();
    final List<String> items = field.optionList!.split(",");
    final List<String> selectedItems = <String>[];
    String result = "";
    return iconTextVertical(
        crossAxisAlignment: CrossAxisAlignment.start,
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: GroupButton<String>(
          controller: controller,
          enableDeselect: true,
          onSelected: (final String value, final int index, final bool isSelected) {
            if(field.type! == 3){
              if(isSelected){
                selectedItems.clear();
                selectedItems.add(value);
              }else{
                selectedItems.clear();
              }
            }else{
              if (isSelected)
                selectedItems.add(value);
              else
                selectedItems.remove(value);
            }
            result = selectedItems.join(",");
            if (selectedItems.isNotEmpty) {
              forms.add(FormReadDto(id: field.id, title: result));
            } else {
              forms.removeWhere((final FormReadDto e) => e.id == field.id);
            }
            widget.onFormChanged(forms);
          },
          buttons: items,
          isRadio: field.type! == 3 ? true : false,
          options: widget.groupButtonOptions ?? const GroupButtonOptions(),
        ));
  }

  Widget _textField({
    required final FormFieldReadDto field,
    final int maxLine = 1,
  }) =>
      iconTextVertical(
        crossAxisAlignment: CrossAxisAlignment.start,
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: TextFormField(
          keyboardType: field.type == 5 ? TextInputType.number : TextInputType.text,
          validator: field.isRequired! ? validateNotEmpty() : null,
          onFieldSubmitted: (final String value) {
            if (value != "") {
              forms.add(FormReadDto(id: field.id, title: value));
              widget.onFormChanged(forms);
            } else {
              forms.removeWhere((final FormReadDto e) => e.id == field.id);
              widget.onFormChanged(forms);
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: maxLine,
          decoration: InputDecoration(
            counter: const SizedBox(),
            fillColor: widget.textFieldFillColor,
            hintStyle: context.textTheme.subtitle2!.copyWith(color: context.theme.hintColor),
            filled: true,
            contentPadding: widget.textFieldPadding,
            focusedBorder: widget.focusedBorder,
            enabledBorder: widget.enabledBorder,
            errorBorder: widget.errorBorder,
            focusedErrorBorder: widget.focusedErrorBorder,
          ),
        ),
      );

  void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
    if (key.currentState!.validate()) action();
  }

  FormFieldValidator<String> validateNotEmpty() => (final String? value) {
    if (value!.isEmpty) return widget.requiredText;
    return null;
  };

}