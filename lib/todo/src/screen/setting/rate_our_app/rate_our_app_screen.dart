import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateOurAppScreen extends StatelessWidget {
  int page = 0;
  UpdateType updateType;
  static final style = TextStyle(
    fontSize: 30,
    // fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );

  var _ratingController = TextEditingController();
  double _rating;
  double _userRating = 3.0;
  int _ratingBarMode = 1;
  bool _isRTLMode = false;
  bool _isVertical = false;
  IconData _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Our App'),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context){
    final pages= [
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow, 
        child: Center(
          child: Text('Rate Our App 1', style: TextStyle(fontSize: 30),),
        )
      ), 
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.greenAccent, 
        child: Center(
          child: Text('Rate Our App 2', style: TextStyle(fontSize: 30),),
        )
      ), 
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent, 
        child: Center(
          child: Text('Rate Our App 3', style: TextStyle(fontSize: 30),),
        )
      ), 
      Container(
        child: RatingBar(
          initialRating: 2,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            _rating = rating;
          },
        ),
      )
    ];

    return LiquidSwipe(
      pages: pages,
      fullTransitionValue: 200,
      enableSlideIcon: false,
      enableLoop: true,
      positionSlideIcon: 0.5,
      waveType: WaveType.liquidReveal,
    );
  }

  // pageChangeCallback(int page) {
  //   print(page);
  // }

  // updateTypeCallback(UpdateType updateType) {
  //   print(updateType);
  // }
}