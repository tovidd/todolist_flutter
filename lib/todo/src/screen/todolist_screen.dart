import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoListType {
  final int id;
  final String judul;
  final String deskripsi;

  TodoListType(this.id, this.judul, this.deskripsi);
}

class TodolistScreen extends StatefulWidget {
  @override
  TodolistScreenState createState() => TodolistScreenState();
}

class TodolistScreenState extends State<TodolistScreen> with SingleTickerProviderStateMixin {
  final List<TodoListType> todolist = [
    TodoListType(1, "Beli persiapan lomba",
        "Beli tali, karton, triplek, bambu, buku gambar, dan pulpen"),
    TodoListType(2, "Pergi ke rumah tante",
        "Jangan lupa bawa kue pesanan tante di pasar"),
    TodoListType(3, "Daftar pengabdian",
        "Syarat fotokopi ktp 1 lembar, transkrip nilai 2 lembar legalisir, dan surat rekomendasi kampus "),
    TodoListType(4, "Bla bla bla",
        "Bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla"),
  ];

  var exp = ExpansionTile(
    title: Text('Details'),
    children: <Widget>[
      new Text("Created at " +
          DateFormat('EEE d MMM kk:mm:ss').format(DateTime.now())),
      new Text("Deadline at " +
          DateFormat('EEE d MMM kk:mm:ss')
              .format(DateTime.now().add(Duration(days: 7)))),
    ],
  );

  Widget expansionTile(List<TodoListType> data, int index){
    return ExpansionTile(
      title: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Text(
              data[index].judul,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              data[index].deskripsi,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      children: <Widget>[
        Text(
          "Created at " +
              DateFormat('EEE d MMM kk:mm:ss').format(DateTime.now()),
          style: TextStyle(fontSize: 12),
        ),
        Text(
          "Deadline at " +
              DateFormat('EEE d MMM kk:mm:ss')
                  .format(DateTime.now().add(Duration(days: 7))),
          style: TextStyle(fontSize: 12),
        ),
        Container(
          height: 10,
        ),
      ],
      initiallyExpanded: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: buildBody(context),
        color: Colors.grey[800],
      ),
    );
  } // Widget build

  Widget buildBody(BuildContext context){
    return ListView.builder(
      itemCount: todolist.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            child: expansionTile(todolist, index),
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        );
      },
    );
  }
}

// https://pub.dev/documentation/animated_floatactionbuttons/latest/
