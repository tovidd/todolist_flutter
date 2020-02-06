import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget gary(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/ic_gary2.gif',
          height: 100,
        ),
      ),
    );
  }

  Widget spinkit() {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitThreeBounce(
          color: Colors.pink,
          size: 50,
        ),
      ),
    );
  }
}
