import 'package:cater_mee/Screens/Home.dart';
import 'package:cater_mee/Screens/settings.dart';
import 'package:flutter/material.dart';

import 'Occasions.dart';
import 'orders.dart';

class Navigationbar extends StatefulWidget {
  int _selectedIndex;
  Navigationbar(this._selectedIndex);
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<Navigationbar> {


  final List<Widget> _widgetOptions = const [
    Home(),
    Occasions(),
    Orders(),
    Settings()
  ];

  void _onItemTap(int index) {
    setState(() {
      widget._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: widget._selectedIndex,
          children: _widgetOptions,
        ),
        floatingActionButton: SizedBox(
          height: mediaQueryHeight*0.1,
          width: mediaQueryWidth*0.15,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 0,
              foregroundColor: Colors.transparent,
              shape: CircleBorder(
                side: BorderSide(
                    color: Theme.of(context).primaryColor, width: mediaQueryWidth*0.001),
              ),
              backgroundColor: Colors.transparent,
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => Addresses(),
                //   ),
                // );
              },
              child: Container(
                  height: mediaQueryHeight*0.06,
                  width: mediaQueryWidth*0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColor),
                  child: const Icon(Icons.add_rounded,
                      color: Colors.yellow, size: 35)),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            selectedLabelStyle: TextStyle(fontFamily: "BerlinSansFB"),
            selectedItemColor:Color.fromRGBO(243, 243, 46, 1),
            unselectedItemColor: Theme.of(context).primaryColor,

            items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/Icon awesome-home.png',),size: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/Icon awesome-calendar-check.png'),size: 25,
                ),
                label: 'Occasions',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/Icon awesome-clipboard-list.png'),size: 25,
                    ),
                    /*Positioned(
                    top: -1.0,
                    right: -1.0,
                    child: Stack(children: [
                     new Icon(
                        Icons.brightness_1,
                        color: Colors.red,
                        size: 12,
                      )
                    ])),*/
                  ],
                ),
                label: 'Orders',
              ),
             BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/images/Group 225.png',),size: 25,
                ),
                label: 'Settings',
              ),
            ],
            currentIndex: widget._selectedIndex,
            onTap: _onItemTap,
          ),
        ));
  }
}