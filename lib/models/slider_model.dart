import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currenPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
