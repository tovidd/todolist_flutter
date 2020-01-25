import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../list_item.dart';
import '../../bloc/change_password/change_password_bloc.dart';
import '../../bloc/change_password/change_password_provider.dart';

class ChangePasswordScreen extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    ChangePasswordBloc bloc= ChangePasswordProvider.of(context);
    bloc.getProduct();
    List<String> list = List();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Change Password', style: TextStyle(color: Colors.yellow),),
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
      body: StreamBuilder(
        stream: bloc.products,
        builder: (context, AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
          return Center(
              child: ListView(
            children: <Widget>[
              for(final map in snapshot.data)
                for(final keys in map.keys) ListItem(keys, map[keys].toList()),
            ],
          ));
        }
      ),
      backgroundColor: Colors.grey[850],
    );
  }


  
}
