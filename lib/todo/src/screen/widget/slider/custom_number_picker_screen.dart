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
//      body: numberPicker(context, bloc),
      body: Carroussel(),
    );
  }

//  https://stackoverflow.com/questions/47349784/creating-image-carousel-in-flutter/47357960#47357960

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

class Carroussel extends StatefulWidget {
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<Carroussel> {
  PageController controller;
  int currentpage = 0;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
            },
            controller: controller,
            itemBuilder: (context, index) => builder(index),
//            itemBuilder: (context, index) => angka(index),
          ),
        ),
      ),
    );
  }

  angka(int index) {
    return Text(
      index.toString(),
      style: TextStyle(fontSize: 30),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return new Center(
          child: new SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: new Container(
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
}
