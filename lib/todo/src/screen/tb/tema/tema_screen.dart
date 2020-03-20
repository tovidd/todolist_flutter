import 'package:flutter/material.dart';
import 'package:todolist/todo/src/resource/constant/constant.dart';
import '../../../model/tb/tema/tema_response_model.dart';
import '../../../model/tb/tema/tema_model.dart';
import 'dart:ui' as ui;
import '../../../bloc/tb/tema/tema_bloc.dart';
import '../../../bloc/tb/tema/tema_provider.dart';

class TemaScreen extends StatelessWidget {
  static const routeName = '/tema';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TemaBloc bloc = TemaProvider.of(context);
    bloc.getTema();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Tema'),
      ),
      body: buildBody(context, bloc),
    );
  }

  Widget buildBody(BuildContext context, TemaBloc bloc) {
    return Center(
      child: RaisedButton(
        color: Colors.pinkAccent,
        onPressed: () {
          popUp(context, bloc);
        },
        child: Text('Pop up'),
      ),
    );
  }

  void popUp(BuildContext context, TemaBloc bloc) {
    Widget space() {
      return SizedBox(
        height: 20,
      );
    }

    Widget close(BuildContext context) {
      return Align(
        alignment: Alignment(1.05, -1.05),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Constant.sliderColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.close,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget body(BuildContext context) {
      Widget card(TemaModel data) {
        String image =
            'https://image.freepik.com/free-photo/summer-holiday-background_71965-5.jpg';
        String image2 =
            'https://cdn.pixabay.com/photo/2016/04/15/04/02/water-1330252__340.jpg';
        String headset =
            'https://i.ya-webdesign.com/images/cartoon-headphones-png-6.png';
        return GestureDetector(
          onTap: () {
            _scaffoldKey.currentState
                .showSnackBar(new SnackBar(content: new Text('tapped')));
            bloc.updateTema(data.id);
          },
          child: Stack(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    data.selected ? image : image2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.network(
                        headset,
                        width: 30,
                      ),
                    ),
                    Center(
                      child: Text(
                        data.title,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }

      return StreamBuilder(
          stream: bloc.temaValue,
          builder: (context, AsyncSnapshot<TemaResponseModel> snapshot) {
            final data = snapshot.data.data;
            return Container(
              color: Colors.white,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                children: data.map((data) => card(data)).toList(),
              ),
            );
          });
    }

    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            body(context),
            close(context),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => dialog,
      barrierDismissible: false,
    );
  }
}
