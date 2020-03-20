import 'package:flutter/material.dart';

class PollingScreen extends StatefulWidget {
  static const routeName = '/polling';

  @override
  _PollingScreenState createState() => _PollingScreenState();
}

class _PollingScreenState extends State<PollingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;

  @override
  void initState() {
    _buttonController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double right = 30.0;

    return Stack(
      children: <Widget>[
        polling(screenSize, right - (right / 4) * 3, Colors.blueAccent[200]),
        polling(screenSize, right - (right / 4) * 2, Colors.pinkAccent[200]),
        polling(screenSize, right - (right / 4) * 1, Colors.greenAccent[200]),
        polling(screenSize, right - (right / 4) * 0, Colors.deepOrange[200]),
      ],
    );
  }

  Widget polling(Size screenSize, double right, Color color) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 30, right: right),
      child: Card(
        color: color,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'SPONSORED',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        Text(
                          'Pertanyaan 1 dari 3',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Berapa jumlah anak Mums saat ini? Berapa jumlah anak Mums saat ini',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          Radio(value: 0, groupValue: 0, onChanged: (val) {}),
                          Text('Satu'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          Radio(value: 1, groupValue: 0, onChanged: (val) {}),
                          Text('Satu'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Simpan'),
                      textColor: Colors.purple,
                      disabledTextColor: Colors.white,
                      color: Colors.white,
                      disabledColor: Colors.grey,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
