import 'package:flutter/material.dart';
import '../../../bloc/setting/rate_our_app/rate_our_app_bloc.dart';
import '../../../bloc/setting/rate_our_app/rate_our_app_provider.dart';

class RateOurAppScreen extends StatelessWidget {
  final IconData filledStar;
  final IconData unfilledStar;
  static const routeName = '/setting_rate_our_app_screen';
  RateOurAppScreen({
    Key key,
    this.filledStar,
    this.unfilledStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RateOurAppBloc bloc = RateOurAppProvider.of(context);
    bloc.getRateOurApp();

    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Our App'),
      ),
      body: ListView(
        children: <Widget>[
          StreamBuilder(
            stream: bloc.rateOurApp,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return buildBody(context, bloc, snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget buildBody(
      BuildContext context, RateOurAppBloc bloc, AsyncSnapshot<int> snapshot) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        title(),
        SizedBox(height: 20),
        rating(bloc, snapshot),
        SizedBox(height: 20),
        textArea(),
        SizedBox(height: 20),
        button(),
      ],
    );
  }

  Widget title() {
    return Container(
      child: Text(
        'Give your thought about Teman Bumil',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget rating(RateOurAppBloc bloc, AsyncSnapshot<int> snapshot) {
    final size = 36.0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) {
            return IconButton(
              onPressed: () {
                bloc.addRateOurApp(index + 1);
              },
              iconSize: size,
              icon: Icon(
                index < snapshot.data
                    ? filledStar ?? Icons.star
                    : unfilledStar ?? Icons.star_border,
                color: Colors.amber,
              ),
              padding: EdgeInsets.zero,
              tooltip: "${index + 1} of 5",
            );
          },
        ),
      ),
    );
  }

  Widget textArea() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'Enter your thought',
          border: OutlineInputBorder(),
          labelText: 'Comment',
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  Widget button(){
    return Container(
      child: RaisedButton(
        onPressed: (){},
        child: Text('Send'),
        color: Color(0xFF3dfd00),
      ),
    );
  }
}
