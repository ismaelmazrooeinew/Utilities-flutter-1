import 'package:utilities/utilities.dart';
import 'package:flutter/material.dart';

enum Type{dropDown,toggle}

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

class MultiItem{
  final int id;
  final String name;
  final Type type;
  final List<String> item;

  MultiItem({required this.name,required this.type, required this.id, required this.item});
}

class Form extends StatefulWidget {
  final List<FormBuilderData> data;
  const Form({Key? key, required this.data}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  List<Widget> body = [];
  List<MultiItem> multi = [];

  @override
  void initState() {
    fillData();
    super.initState();
  }

  Future<void> fillData()async{
    print(widget.data.length);
    for (FormBuilderData element in widget.data) {
      print(element.name);
      body.add(Container(height: 10,color: Colors.blue));
      switch (element.valueTypeId) {
        case 0:
          body.add(textField(keyboardType: TextInputType.text,label: element.name));
          break;
        case 1:
          body.add(textField(keyboardType: TextInputType.number,label: element.name));
          break;
        case 2:
          body.add(textField(keyboardType: TextInputType.number,label: element.name));
          break;
        case 3:
          body.add(date());
          break;
        case 4:
          body.add(multiTextField());
          break;
        case 5:
          multi.add(MultiItem(id: element.id,type: Type.toggle,name: element.name,item: []));
          break;
        case 6:
          multi.add(MultiItem(id: element.id,type: Type.dropDown,name: element.name,item: []));
          break;
        case 7:
          body.add(textField(keyboardType: TextInputType.phone,label: element.name));
          break;
        case 8:
          for (var item in multi) {
            if(item.id == element.parentId){
              item.item.add(element.name);
            }
          }
          break;
        default:
          body.add(Container(height: 10,color: Colors.red));
          break;
      }
    }
    for (var item in multi) {
      if(item.type == Type.toggle) {
        body.add(toggle(item));
      } else if(item.type == Type.dropDown){
        body.add(dropDown(item));
      }
    }
  }

  Widget textField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
}){
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue,width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: TextField(
          keyboardType: keyboardType,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: label,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
  
  Widget date(){
    return Container(
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.green,
    );
  }
  Widget multiTextField(){
    return Container(
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey,
    );
  }
  Widget dropDown(MultiItem data){
    return Container(
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.brown,
    );
  }
  Widget toggle(MultiItem data){
    return Container(
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.yellow,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Builder'),),
      body: SingleChildScrollView(child: Column(children: body)),
    );
  }
}