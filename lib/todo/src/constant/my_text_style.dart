import 'package:flutter/material.dart';
import 'package:todolist/todo/src/constant/my_font_weight.dart';

class GSTextStyle {
  static GSTextStyleFontWeight get h1 =>
      GSTextStyleFontWeight.custom(fontSize: 24.0);

  static GSTextStyleFontWeight get h2 =>
      GSTextStyleFontWeight.custom(fontSize: 22.0);

  static GSTextStyleFontWeight get h3 =>
      GSTextStyleFontWeight.custom(fontSize: 20.0);

  static GSTextStyleFontWeight get h4 =>
      GSTextStyleFontWeight.custom(fontSize: 18.0);

  static GSTextStyleFontWeight get h5 =>
      GSTextStyleFontWeight.custom(fontSize: 16.0);

  static GSTextStyleFontWeight get h6 =>
      GSTextStyleFontWeight.custom(fontSize: 14.0);
}

class GSTextStyleFontWeight extends Palette {
  double fontSize;

  GSTextStyleFontWeight();

  GSTextStyleFontWeight.custom({this.fontSize});

  TextStyle get _thin => TextStyle(
    fontWeight: MyFontWeight.thin,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _extraLight => TextStyle(
    fontWeight: MyFontWeight.extraLight,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _light => TextStyle(
    fontWeight: MyFontWeight.light,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _normal => TextStyle(
    fontWeight: MyFontWeight.normal,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _medium => TextStyle(
    fontWeight: MyFontWeight.medium,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _semiBold => TextStyle(
    fontWeight: MyFontWeight.semiBold,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _bold => TextStyle(
    fontWeight: MyFontWeight.bold,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _extraBold => TextStyle(
    fontWeight: MyFontWeight.extraBold,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  TextStyle get _ultraBold => TextStyle(
    fontWeight: MyFontWeight.ultraBold,
    color: Colors.black,
    fontSize: this.fontSize,
  );

  @override
  MyColor get thin => MyColor.custom(_thin);

  @override
  MyColor get extraLight => MyColor.custom(_extraLight);

  @override
  MyColor get light => MyColor.custom(_light);

  @override
  MyColor get normal => MyColor.custom(_normal);

  @override
  MyColor get medium => MyColor.custom(_medium);

  @override
  MyColor get semiBold => MyColor.custom(_semiBold);

  @override
  MyColor get bold => MyColor.custom(_bold);

  @override
  MyColor get extraBold => MyColor.custom(_extraBold);

  @override
  MyColor get ultraBold => MyColor.custom(_ultraBold);
}

abstract class Palette extends MyColor {
  Palette();

  MyColor get thin;

  MyColor get extraLight;

  MyColor get light;

  MyColor get normal;

  MyColor get medium;

  MyColor get semiBold;

  MyColor get bold;

  MyColor get extraBold;

  MyColor get ultraBold;
}

class MyColor {
  TextStyle _textStyle;

  MyColor();

  MyColor.custom(this._textStyle);

  TextStyle tint(Color color) => _textStyle.merge(TextStyle(color: color));
}
