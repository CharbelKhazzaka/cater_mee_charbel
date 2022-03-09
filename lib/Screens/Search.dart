import 'package:cater_mee/Screens/Home.dart';
import 'package:cater_mee/Screens/Nav_bar.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class Meal {
  final String title;

  const Meal({
    required this.title,
  });
}

class _SearchState extends State<Search> {
  static const allMeals = [
    Meal(title: 'Regular Breakfast'),
    Meal(title: 'Extra Breakfast'),
    Meal(title: 'VIP Breakfast'),
    Meal(title: 'Regular Lunch'),
    Meal(title: 'Extra Lunch'),
    Meal(title: 'VIP Lunch'),
    Meal(title: 'Regular Dinner'),
    Meal(title: 'Extra Dinner'),
    Meal(title: 'VIP Dinner'),
  ];
  List<Meal> Meals = allMeals;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: mediaQueryHeight * 0.03),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Navigationbar(0)),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.75,
                    height: mediaQueryHeight * 0.1,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(72, 72, 72, 1),
                              fontFamily: 'BerlinSansFB',
                              fontSize: 18),
                          fillColor: Color.fromRGBO(232, 232, 232, 1),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: mediaQueryHeight * 0.05),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Meals.length,
                itemExtent: mediaQueryHeight * 0.1,
                itemBuilder: (context, index) {
                  final Meal = Meals[index];
                  return Padding(
                    padding:EdgeInsets.only(left: mediaQueryWidth*0.05,right: mediaQueryWidth*0.05),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 1,
                      child: ListTile(
                        dense: true,
                        title: Text(
                          Meal.title,
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'BerlinSansFB',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
