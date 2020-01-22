import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class AddTodolistScreen extends StatefulWidget {
  @override
  AddTodolistScreenState createState() => AddTodolistScreenState();
}

class AddTodolistScreenState extends State<AddTodolistScreen> {
  @override
  Widget build(BuildContext context) {
    return null;
  }

  void showModalSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (builder) {
        return BottomSheetContent();
      },
    ); 
  }
}

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add an Item',
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            textField(
                "To do", "Cannot be empty", "", "Write Your To do . . ."),
            SizedBox(
              height: 20,
            ),
            textField("Description", "Cannot be empty", "",
                "Write Your Description . . ."),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  DateFormat('EEE d MMM yyyy – kk:mm a').format(selectedDate),
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  child: Text(
                    "Change",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                )
              ],
            ), 
            SizedBox(
              height: 20,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text("Add Now", textAlign: TextAlign.center,),
              ), 
              onPressed: (){
                print('Add Now Clicked');
              },
            )
          ],
        ),
        padding: EdgeInsets.all(20),
      ), 
    );
  }

  Widget textField(String label, String message, String value, String hint) {
    return TextFormField(
      initialValue: value,
      decoration: new InputDecoration(
        labelText: label,
        hintText: hint,
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return message;
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime picked = await DatePicker.showDateTimePicker(context,
        minTime: DateTime.now(),
        theme: DatePickerTheme(
            backgroundColor: Colors.black,
            itemStyle: TextStyle(color: Colors.yellow),
            cancelStyle: TextStyle(color: Colors.yellow),
            doneStyle:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
