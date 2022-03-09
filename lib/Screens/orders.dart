import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Center(
            child: Text(
              'My orders',
              style: TextStyle(fontFamily: 'BerlinSansFB', color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('NO ORDERS ADDED YET!', style: TextStyle(fontFamily: 'BerlinSansFB',fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
