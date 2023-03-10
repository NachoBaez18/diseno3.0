import 'package:disenosp2/pages/slideShow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlidesshowPage();

  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;
}
