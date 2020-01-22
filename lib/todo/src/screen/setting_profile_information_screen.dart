import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/setting_profile_information_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SettingProfileInformationScreen extends StatefulWidget {
  @override
  SettingProfileInformationScreenState createState() =>
      SettingProfileInformationScreenState();
}

class SettingProfileInformationScreenState
    extends State<SettingProfileInformationScreen> {
  SettingProfileInformation model;
  bool isLoading = true;

  Future<SettingProfileInformation> fetchPost() async {
    final response= await http.get('http://www.mocky.io/v2/5e212fa32f0000670077d4ae?mocky-delay=5000ms'); //succes res
    // final response = await http.get('http://www.mocky.io/v2/5e217e262f0000800077d6c1?mocky-delay=5000ms'); //failed res
    print(response.body);
    final parseJson = json.decode(response.body);
    model = SettingProfileInformation.fromJson(parseJson);
    setState(() {});
    return model;
  }

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      fetchPost();
    }
    if(model?.status == 'success'){
      return Scaffold(
        body: SafeArea(
          child: demo(),
        ),
      );
    }
    else{
      return Container(
        child: model != null
            ? failLoadData()
            : Container(
                color: Colors.white,
                child: spinkit(),
              ),
      );
    }
  }

  Widget spinkit() {
    if (model == null) {
      return SpinKitThreeBounce(
        color: Colors.pink,
        size: 50,
      );
    } else {
      return null;
    }
  }

  Widget failLoadData(){
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(model?.message ?? 'Authentication Failed HARDTEXT', style: TextStyle(fontSize: 20)), 
                SizedBox(height: 20,),
                RaisedButton(
                  color: Colors.pink,
                  child: Text('Retry'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingProfileInformationScreen()),);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> avatar(String image_url, String message, Color text_color) {
    return <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(image_url),
        radius: 60,
        backgroundColor: Colors.transparent,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        model?.user?.fullName ?? message,
        style: TextStyle(
            color: text_color,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 18),
        textAlign: TextAlign.center,
      )
    ];
  }

  Widget demo() => Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              DecoratedBox(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(0, 255, 252, 1.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    child: Center(
                        child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: model?.status != 'error'
                            ? avatar(model?.user?.avatar ?? '', 'loading',
                                Colors.white)
                            : avatar(
                                'https://toptests.co.uk/wp-content/uploads/2017/02/failed-theory-test.png',
                                'Failed load data',
                                Colors.red),
                      ),
                    )),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(left: 50, top: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.mail,
                                color: Color.fromRGBO(0, 175, 175, 1.0)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              model?.user?.email ?? 'loading',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.question_answer,
                                color: Color.fromRGBO(0, 175, 175, 1.0)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              model?.user?.gender ?? 'loading',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.cake,
                                color: Color.fromRGBO(0, 175, 175, 1.0)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              model?.user?.age == null
                                  ? 'loading'
                                  : model?.user?.age.toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 200),
            child: Column(children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                    )
                  ],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Photos",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              model?.user?.photosCount == null
                                  ? 'loading'
                                  : model?.user?.photosCount.toString(),
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 175, 175, 1.0),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Followers",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              model?.user?.followersCount == null
                                  ? 'loading'
                                  : NumberFormat.compact()
                                      .format(model?.user?.followersCount)
                                      .toString(),
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 175, 175, 1.0),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Following",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              model?.user?.followingCount == null
                                  ? 'loading'
                                  : NumberFormat.compact()
                                      .format(model?.user?.followingCount)
                                      .toString(),
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 175, 175, 1.0),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ), 
        ],
      );
}
