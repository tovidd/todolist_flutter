import 'package:flutter/material.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'todolist_screen.dart';
import 'add_todolist_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TodoList',
          style: TextStyle(color: Colors.yellow),
        ),
        actions: popupMenu(context),
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.grey[850],
      body: Container(
        color: Colors.grey[800],
        child: TodolistScreen(),
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget>[
          delete(context),
          overdue(context),
          done(context),
          add(context)
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );
  } // Widget build

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

  Widget add(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
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

  Widget done(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/doneTodolist');
        },
        tooltip: 'Done Item(s)',
        heroTag: 'Done Item(s)',
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

  Widget delete(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/deleteTodolist');
        },
        tooltip: 'Deleted Item(s)',
        heroTag: 'Deleted Item(s)',
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

  Widget overdue(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/overdueTodolist');
        },
        tooltip: 'Overdue Item(s)',
        heroTag: 'Overdue Item(s)',
        child: Icon(
          Icons.access_time,
          color: Colors.orangeAccent[400],
        ),
        mini: true,
        shape: borderFABorange,
        backgroundColor: Colors.black,
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  List<Widget> popupMenu(BuildContext context) {
    return <Widget>[
      PopupMenuButton<String>(
        onSelected: (String choice) async{
          choiceAction(context, choice);
        },
        itemBuilder: (context){
          return PopupMenuChoice.choices.map((PopupMenuChoice choice){
            return PopupMenuItem<String>(
              value: choice.title,
              child: Row(
                children: <Widget>[
                  Icon(choice.icon, color: Colors.black,), 
                  SizedBox(width: 10,), 
                  Text(choice.title)
                ],
              ),
            );
          }).toList();
        },
      ),
    ];
  }

  void choiceAction(BuildContext context, String choice){
    if(choice == PopupMenuChoice.Setting){
      Navigator.pushNamed(context, '/setting');
      print('Setting');
    }
    else if(choice == PopupMenuChoice.Share){
      print('Share');
    }
  }

}

class PopupMenuChoice{
  final String title;
  final IconData icon;

  static const Setting= 'Setting';
  static const Share= 'Share';
  const PopupMenuChoice(this.title, this.icon);

  static const List<PopupMenuChoice> choices= [
    PopupMenuChoice(Setting, Icons.settings), 
    PopupMenuChoice(Share, Icons.share)
  ];
}



// https://pub.dev/documentation/animated_floatactionbuttons/latest/
// https://medium.com/flutterpub/flutter-5-bottom-sheet-2d56bf9f3bc
