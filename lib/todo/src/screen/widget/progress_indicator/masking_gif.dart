import 'package:flutter/material.dart';

class MaskingGif extends StatelessWidget {
  static const routeName = '/masking_gif';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masking'),
      ),
      body: buildBody(),
      backgroundColor: Colors.yellow,
    );
  }

  Widget buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: ShaderMask(
        child: Image.asset('assets/ic_bird.gif'),
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [Colors.blue, Colors.redAccent, Colors.deepPurpleAccent],
            stops: [0.0, 0.4, 0.7],
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
      ),
    );
  }
}
