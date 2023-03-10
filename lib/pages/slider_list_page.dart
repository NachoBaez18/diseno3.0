import 'package:disenosp2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList(),
          )
        ],
      ),

      //_ListaDeTareas()
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      child: MaterialButton(
        height: 100,
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.accentColor
            : Color(0xffED6762),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
        onPressed: () {},
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
    ];
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('hola'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheigth: 170,
            maxheigth: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            height: 100,
          ),
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheigth;
  final double maxheigth;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minheigth, required this.maxheigth, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxheigth;

  @override
  double get minExtent => minheigth;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheigth != oldDelegate.maxheigth ||
        minheigth != oldDelegate.minheigth ||
        child != oldDelegate.child;
  }
}

class _ListaDeTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) => items[index]);
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text('List',
                  style: TextStyle(
                      color: Color(0xffD93A30),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(
        titulo,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (appTheme.darkTheme) ? Colors.grey : color,
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
