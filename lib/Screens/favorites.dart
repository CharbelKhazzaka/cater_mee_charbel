import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            'My Favorites',
            style: TextStyle(fontFamily: 'BerlinSansFB', color: Colors.white),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'NO ITEMS YET!',
            style: TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
          )),
          Center(
              child: Text(
            'CHECK OUR MENUS AND CHOOSE YOUR FAVORITES',
            style: TextStyle(
                fontFamily: 'BerlinSansFB',
                fontSize: 18,
                color: Theme.of(context).primaryColor),textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
