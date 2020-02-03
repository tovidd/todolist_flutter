import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/profile_information/profile_information_model.dart';
import '../../../model/profile_information/profile_information_response_model.dart';
import '../../../bloc/setting/profile_information/profile_information_bloc.dart';
import '../../../bloc/setting/profile_information/profile_information_provider.dart';
import '../../../resource/loading.dart';

class ProfileInformationScreen extends StatelessWidget {
  static const routeName = '/setting_profile_information';

  @override
  Widget build(BuildContext context) {
    ProfileInformationBloc bloc =
        ProfileInformationProvider.of(context);
    bloc.getFeed();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
      extendBodyBehindAppBar: true,
      body: buildBody(context, bloc.feeds),
    );
  }

  Widget buildBody(BuildContext context,
      Stream<ProfileInformationResponseModel> stream) {
    return Container(
      child: StreamBuilder(
        stream: stream,
        builder: (context,
            AsyncSnapshot<ProfileInformationResponseModel> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            // return spinkit();
            return Loading().gary(context);
          }
          if (snapshot.data.status == 'error') {
            return failLoadData(snapshot.data, context);
          }
          return stack(context, snapshot.data.data);
        },
      ),
    );
  }

  Widget failLoadData(
      ProfileInformationResponseModel data, BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[800],
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/ic_408_timeout.png',
                  height: 150,
                  width: 150,
                ),
                Text(data?.message ?? 'Request Failed',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.yellow,
                  child: Text('Retry', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfileInformationScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> avatar(ProfileInformationModel data, String image_url,
      String message, Color text_color) {
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
        data?.fullName ?? message,
        style: TextStyle(
            color: text_color,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 18),
        textAlign: TextAlign.center,
      )
    ];
  }

  Widget stack(BuildContext context, ProfileInformationModel data) {
    return Stack(
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
                        children: avatar(
                          data,
                          data?.avatar ?? '',
                          'loading',
                          Colors.white,
                        )),
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
                          Icon(
                            Icons.mail,
                            color: Color.fromRGBO(0, 175, 175, 1.0),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            data?.email ?? 'loading',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.question_answer,
                            color: Color.fromRGBO(0, 175, 175, 1.0),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            data?.gender ?? 'loading',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.cake,
                            color: Color.fromRGBO(0, 175, 175, 1.0),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            data?.age == null
                                ? 'loading'
                                : data?.age.toString(),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
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
                        Text(
                          "Photos",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data?.photosCount == null
                              ? 'loading'
                              : data?.photosCount.toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(0, 175, 175, 1.0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
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
                          data?.followersCount == null
                              ? 'loading'
                              : NumberFormat.compact()
                                  .format(data?.followersCount)
                                  .toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(0, 175, 175, 1.0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Following",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data?.followingCount == null
                              ? 'loading'
                              : NumberFormat.compact()
                                  .format(data?.followingCount)
                                  .toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(0, 175, 175, 1.0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
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
}
