import 'package:disenosp2/theme/theme.dart';
import 'package:disenosp2/widgets/pinteres_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinteresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [PinteresGrid(), _PinteresMenuPosition()],
        ),
        //  body: PinterestMenu(),
      ),
    );
  }
}

class _PinteresMenuPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }
    return Positioned(
        bottom: 30,
        child: Container(
            width: widthPantalla,
            child: Row(
              children: [
                Spacer(),
                PinterestMenu(
                  backgroundColor: appTheme.scaffoldBackgroundColor,
                  activeColor: appTheme.accentColor,
                  items: [
                    PinteresButton(
                        onPressed: () {
                          print('Icon pie_chart');
                        },
                        icon: Icons.pie_chart),
                    PinteresButton(
                        onPressed: () {
                          print('Icon search');
                        },
                        icon: Icons.search),
                    PinteresButton(
                        onPressed: () {
                          print('Icon notifications');
                        },
                        icon: Icons.notifications),
                    PinteresButton(
                        onPressed: () {
                          print('Icon supervised_user_circle');
                        },
                        icon: Icons.supervised_user_circle),
                  ],
                  mostrar: mostrar,
                ),
                Spacer(),
              ],
            )));
  }
}

class PinteresGrid extends StatefulWidget {
  @override
  State<PinteresGrid> createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItems(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItems extends StatelessWidget {
  final int index;
  const _PinteresItems(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
