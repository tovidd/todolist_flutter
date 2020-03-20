import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  static const routeName = '/language';

  @override
  State<StatefulWidget> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: LanguageScreenBody());
  }
}

class LanguageScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LanguageScreenBodyState();
}

class _LanguageScreenBodyState extends State<LanguageScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(AppLocalization.of(context).heyWorld),
          ),
      body: Center(
        child: Text('Test'),
      ),
    );
  }
}
