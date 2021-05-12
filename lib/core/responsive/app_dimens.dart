import 'package:flutter/material.dart';

class AppDimens {
  static late double _height;
  static late double _width;
  static late double _heightPadding;
  static late double _widthPadding;

  AppDimens(BuildContext context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  AppDimens.init(BuildContext context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  static double rH(double v) {
    return _height * v;
  }

  static double rW(double v) {
    return _width * v;
  }

  static double rHP(double v) {
    return _heightPadding * v;
  }

  static double rWP(double v) {
    return _widthPadding * v;
  }

  static double paddingSmall() {
    return rHP(2);
  }

  static double paddingTiny() {
    return rHP(1);
  }

  static double paddingNormal() {
    return rHP(4);
  }

  static double padding() {
    return rHP(5);
  }

  static double textHeader() {
    return rHP(5);
  }

  static double textTitle() {
    return rWP(4.5);
  }

  static double textNormal() {
    return rHP(2.7);
  }

  static double textHint() {
    return rHP(2);
  }
  static double textSize(double size) {
    return rHP(size);
  }
}
