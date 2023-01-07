import 'package:disenosp2/models/layout_model.dart';
import 'package:disenosp2/pages/launcer_page.dart';
import 'package:disenosp2/pages/launcer_tablet_page..dart';
import 'package:disenosp2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeChanger>(
              create: (_) => new ThemeChanger(2)),
          ChangeNotifierProvider<LayoutModel>(
            create: (_) => new LayoutModel(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientation $orientation');
          // return Container(
          //   child: LauncherPage(),
          // );

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTablePage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
