import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../bloc/widget/slider/custom_number_picker_bloc.dart';
import '../../../bloc/widget/slider/custom_number_picker_provider.dart';

class CustomNumberPickerScreen extends StatelessWidget {
  static const routeName = '/custom_number_picker_screen';

  @override
  Widget build(BuildContext context) {
    CustomNumberPickerBloc bloc = CustomNumberPickerProvider.of(context);
    bloc.getNumberPickerValue();

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Number Picker'),
      ),
      body: numberPicker(context, bloc),
    );
  }

  Widget numberPicker(BuildContext context, CustomNumberPickerBloc bloc) {
    final theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Center(
      child: StreamBuilder(
          stream: bloc.numberPickerValue,
          builder: (context, snapshot) {
            return Theme(
              data: theme.copyWith(
                  accentColor: Colors.black, // highlted color
                  textTheme: theme.textTheme.copyWith(
                    headline: theme.textTheme.headline
                        .copyWith(color: Colors.greenAccent),
                    //other highlighted style
                    body1: theme.textTheme.headline.copyWith(
                        color: Colors.pinkAccent), //not highlighted styles
                  )),
              child: NumberPicker.horizontal(
                initialValue: snapshot.data,
                minValue: 1,
                maxValue: 10,
                zeroPad: true,
                itemExtent: 100,
                highlightSelectedValue: true,
                onChanged: (value) {
                  bloc.addNumberPickerValue(value);
                },
              ),
            );
          }),
    );
  }

  Decoration decoration(double width, double height) {
    return BoxDecoration(
      border: new Border(
        top: new BorderSide(
          style: BorderStyle.solid,
          color: Colors.black26,
          width: 2,
        ),
        bottom: new BorderSide(
          style: BorderStyle.solid,
          color: Colors.yellow,
          width: 2,
        ),
      ),
    );
  }
}
