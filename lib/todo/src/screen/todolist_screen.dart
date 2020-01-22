import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../bloc/todolist/todolist_provider.dart';
import '../bloc/todolist/todolist_bloc.dart';
import '../model/todolist/todolist_model.dart';
import '../model/todolist/todolist_response_model.dart';


class TodolistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodolistBloc bloc= TodolistProvider.of(context);
    bloc.getFeed();

    return Scaffold(
      body: Container(
        child: buildBody(context, bloc.feeds),
        color: Colors.grey[800],
      ),
    );
  } 

  Widget expansionTile(TodolistModel data, int index){
    return ExpansionTile(
      title: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              data.description,
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
          "Created at " + DateFormat('EEE, d MMM yy (kk:mm a)').format(DateTime.parse(data.createdAt)),
          style: TextStyle(fontSize: 12),
        ),
        Text(
          "Deadline at " +
              DateFormat('EEE, d MMM yy (kk:mm a)')
                  .format(DateTime.parse(data.deadlineAt)),
          style: TextStyle(fontSize: 12),
        ),
        Container(
          height: 10,
        ),
      ],
      initiallyExpanded: false,
    );
  }

  Widget buildBody(BuildContext context, Stream<TodolistResponseModel> stream){
    return Container(
        child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<TodolistResponseModel> snapshot){
          if(!snapshot.hasData || snapshot.data == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  child: expansionTile(snapshot.data.data[index], index),
                ),
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              );
            },
          );
        },
      ),
    );
  }

    
  
}

// https://pub.dev/documentation/animated_floatactionbuttons/latest/
