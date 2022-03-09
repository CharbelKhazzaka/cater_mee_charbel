import 'package:flutter/material.dart';

class Notifactions extends StatelessWidget {
  const Notifactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            'Notification',
            style: TextStyle(fontFamily: 'BerlinSansFB', color: Colors.white),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'NO NOTIFICATIONS YET!',
            style: TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
          ))
        ],
      ),
    );
  }
}
