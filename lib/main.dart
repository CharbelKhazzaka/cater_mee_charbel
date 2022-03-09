
import 'package:cater_mee/Screens/Auth/log_in.dart';
import 'package:cater_mee/Screens/Introduction/Intro_screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Home.dart';

Future main()async{
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome= prefs.getBool('showHome')?? false;
  runApp(MyApp(showHome:showHome));}


class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key?key,
    required this.showHome,
  }) : super (key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(63, 85, 33, 1.0),
      ),
      home:showHome ? LogIn(): Intro(),
    );
  }
}
