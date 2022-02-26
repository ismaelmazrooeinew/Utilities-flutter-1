import 'package:utilities/utilities.dart';
import 'package:flutter/material.dart';

enum Type { dropDown, toggle }

class FormBuilderData {
  FormBuilderData({
    required this.id,
    required this.name,
    required this.orderNumber,
    required this.valueTypeId,
    this.parentId,
  });

  final int id;
  final String name;
  final int orderNumber;
  final int valueTypeId;
  final int? parentId;
}

class MultiItem {
  final int id;
  final String name;
  final Type type;
  final List<String> item;

  MultiItem(
      {required this.name,
      required this.type,
      required this.id,
      required this.item});
}

class FormBuilder extends StatefulWidget {
  final List<FormBuilderData> data;

  const FormBuilder({Key? key, required this.data}) : super(key: key);

  @override
  _FormBuilderState createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  List<Widget> body = [];
  List<MultiItem> multi = [];
  DateTime selectedDate = DateTime.now();
  late BuildContext contextDate;

  @override
  void initState() {
    fillData();
    super.initState();
  }

  Future<void> _selectDate(VoidCallback action) async {
    final DateTime? picked = await showDatePicker(
      context: contextDate,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) selectedDate = picked;
    action();
  }

  Future<void> fillData() async {
    for (FormBuilderData element in widget.data) {
      switch (element.valueTypeId) {
        case 0:
          body.add(
              textField(keyboardType: TextInputType.text, label: element.name));
          break;
        case 1:
          body.add(textField(
              keyboardType: TextInputType.number, label: element.name));
          break;
        case 2:
          body.add(textField(
              keyboardType: TextInputType.number, label: element.name));
          break;
        case 3:
          body.add(date());
          break;
        case 4:
          body.add(multiTextField(label: element.name));
          break;
        case 5:
          multi.add(MultiItem(
              id: element.id, type: Type.toggle, name: element.name, item: []));
          break;
        case 6:
          multi.add(MultiItem(
              id: element.id,
              type: Type.dropDown,
              name: element.name,
              item: []));
          break;
        case 7:
          body.add(textField(
              keyboardType: TextInputType.phone, label: element.name));
          break;
        case 8:
          for (var item in multi) {
            if (item.id == element.parentId) {
              item.item.add(element.name);
            }
          }
          break;
        default:
          body.add(Container(height: 10, color: Colors.red));
          break;
      }
    }
    for (var item in multi) {
      if (item.type == Type.toggle) {
        body.add(toggle(item));
      } else if (item.type == Type.dropDown) {
        body.add(dropDown(item));
      }
    }
  }

  Widget textField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) =>
      Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: TextField(
            keyboardType: keyboardType,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: label,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
        ),
      );

  Widget date() => Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${selectedDate.toLocal()}".split(' ')[0]),
              IconButton(
                  onPressed: () => _selectDate(() {
                        setState(() {});
                      }),
                  icon: Icon(Icons.calendar_today_outlined)),
            ],
          );
        }),
      );

  Widget multiTextField({
    required String label,
  }) =>
      Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextField(
          keyboardType: TextInputType.multiline,
          expands: true,
          maxLines: null,
          minLines: null,
          decoration: InputDecoration(
            hintText: label,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      );

  Widget dropDown(MultiItem data) => Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: const InputDecoration.collapsed(hintText: ''),
            hint: Container(
              child: Text(
                data.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
            icon: Icon(Icons.arrow_drop_down_outlined),
            items: data.item.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? text) {},
          ),
        ),
      );

  Widget toggle(MultiItem data) {
    List<bool> check = List<bool>.generate(data.item.length, (i) => false);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                data.name,
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
          SizedBox(height: 10),
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return GridView.builder(
              primary: true,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 2,
              ),
              itemCount: data.item.length,
              itemBuilder: (context, index) {
                final dataList = data.item[index];
                return InkWell(
                  onTap: () {
                    check = check.map((e) => e = false).toList();
                    setState(() {
                      check[index] = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: check[index]
                          ? Colors.blue
                          : Colors.blueAccent.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Text(
                        dataList,
                        style: TextStyle(
                            color: check[index] ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    contextDate = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Builder'),
      ),
      body: SingleChildScrollView(child: Column(children: body)),
    );
  }
}
