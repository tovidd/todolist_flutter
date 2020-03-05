import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class AssetText extends StatelessWidget {
  static const routeName = '/asset_text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AssetText.routeName),
        centerTitle: false,
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    Future<String> loadAsset() async {
      return await rootBundle.loadString('assets/txt/lorem_ipsum.txt');
    }

    return Container(
      child: Row(
        children: <Widget>[
          FutureBuilder(
            future: loadAsset(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none &&
                  !snapshot.hasData) {
                return Text('no data');
              }
              return Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    snapshot.data,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
