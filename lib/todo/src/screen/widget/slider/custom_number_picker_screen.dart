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
  PageController pageController;
  int currentpage = 0;

  @override
  initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentpage,
      keepPage: true,
      viewportFraction: 0.25,
    );
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: PageView.builder(
            itemCount: 10,
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
            },
            controller: pageController,
            itemBuilder: (context, index) => angka(index),
            physics: ScrollPhysics(),
          ),
        ),
      ),
    );
  }

  angka(int index) {
    pageController.animateToPage(currentpage,
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1.0;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }
        return Center(
          child: Container(
            height: Curves.easeOut.transform(value) * 500,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: Center(
        child: currentpage == index
            ? Container(
                margin: EdgeInsets.only(top: 40),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Text(
                    (index).toString(),
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    currentpage = index;
                  });
                },
                child: Container(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue[100],
                    child: Text(
                      (index).toString(),
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
