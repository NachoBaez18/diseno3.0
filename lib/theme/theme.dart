import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _curretTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._curretTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _curretTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _curretTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
        break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _curretTheme = ThemeData.light().copyWith(
          accentColor: Colors.pink,
        );
        break;
    }
  }

  set darkTheme(bool valor) {
    _customTheme = false;
    this._darkTheme = valor;

    if (valor) {
      _curretTheme = ThemeData.dark().copyWith(
        accentColor: Colors.pink,
      );
    } else {
      _curretTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }
    notifyListeners();
  }

  set customTheme(bool valor) {
    _darkTheme = false;
    this._customTheme = valor;
    if (valor) {
      _curretTheme = ThemeData.dark().copyWith(
          accentColor: Color(0xff48A0EB),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202B),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
    } else {
      _curretTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
