import 'package:flutter/material.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'todolist_screen.dart';
import 'add_todolist_screen.dart';
import 'setting_screen.dart'; 

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var borderFABred = RoundedRectangleBorder(
      side: BorderSide(
          color: Colors.redAccent[400], width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(30.0));

  var borderFABgreen = RoundedRectangleBorder(
      side: BorderSide(
          color: Colors.greenAccent[400], width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(30.0));

  var borderFABblue = RoundedRectangleBorder(
      side: BorderSide(
          color: Colors.blueAccent[400], width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(30.0));

  var borderFABorange = RoundedRectangleBorder(
      side: BorderSide(
          color: Colors.orangeAccent[400], width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(30.0));

  Widget tambah() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          AddTodolistScreenState().showModalSheet(context);
        },
        tooltip: 'Add an Item',
        heroTag: 'Add an Item',
        child: Icon(
          Icons.add,
          color: Colors.blueAccent[400],
          size: 30,
        ),
        mini: true,
        shape: borderFABblue,
        backgroundColor: Colors.black,
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  Widget selesai() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Finised Items',
        heroTag: 'Finised Items',
        child: Icon(
          Icons.done_all,
          color: Colors.greenAccent[400],
        ),
        mini: true,
        shape: borderFABgreen,
        backgroundColor: Colors.black,
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  Widget hapus() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Deleted Items',
        heroTag: 'Deleted Items',
        child: Icon(
          Icons.delete,
          color: Colors.redAccent[400],
        ),
        mini: true,
        shape: borderFABred,
        backgroundColor: Colors.black,
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  Widget setting() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          SettingScreenState().showModalSheet(context);
        },
        tooltip: 'Setting',
        heroTag: 'Setting',
        child: Icon(
          Icons.settings,
          color: Colors.orangeAccent[400],
        ),
        mini: true,
        shape: borderFABorange,
        backgroundColor: Colors.black,
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TodoList',
          style: TextStyle(color: Colors.yellow),
        ),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.add), 
              color: Colors.yellow,
              iconSize: 20,
              onPressed: (){AddTodolistScreenState().showModalSheet(context);},
            ),
          )
        ],
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.grey[850],
      body: Container(
        child: TodolistScreen(),
        color: Colors.grey[800],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget>[setting(), hapus(), selesai(), tambah()],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );
  } // Widget build

  
}

// https://pub.dev/documentation/animated_floatactionbuttons/latest/
// https://medium.com/flutterpub/flutter-5-bottom-sheet-2d56bf9f3bc
