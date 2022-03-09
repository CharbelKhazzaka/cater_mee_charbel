import 'package:cater_mee/Carousel_Items/Item1.dart';
import 'package:cater_mee/Carousel_Items/Item2.dart';
import 'package:cater_mee/Carousel_Items/Item3.dart';
import 'package:cater_mee/Screens/Search.dart';
import 'package:cater_mee/Screens/add_occasion.dart';
import 'package:cater_mee/Screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import 'notifacations.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateFormat formatter = DateFormat(' MMM d');
    final String formatted = formatter.format(now);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    final List cardList = [
      Item1(),
      Item2(),
      Item3(),
    ];
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: mediaQueryHeight * 0.01, left: mediaQueryWidth * 0.06),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: mediaQueryHeight * 0.05,
                        width: mediaQueryWidth * 0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'BerlinSansFB'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQueryWidth * 0.05),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chat_outlined),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Favorites()),
                      );  },
                      icon: Icon(Icons.favorite),
                      color: Theme.of(context).primaryColor,
                    ),
                    IconButton(
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Notifactions()),
                      );  },
                      icon: Icon(Icons.notifications),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.05,
                    top: mediaQueryHeight * 0.05,
                    bottom: mediaQueryHeight * 0.01),
                child: Text(
                  'Packages',
                  style: TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  height: mediaQueryHeight * 0.35,
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        child: card,
                      ),
                    );
                  });
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mediaQueryHeight * 0.1,
                    left: mediaQueryWidth * 0.05,
                    right: mediaQueryWidth * 0.05,
                    bottom: mediaQueryHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Occasions',
                      style:
                          TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
                    ),
                    Text(
                      'See All',
                      style:
                          TextStyle(fontFamily: 'BerlinSansFB', fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: mediaQueryWidth * 0.05),
                child: Container(
                  height: mediaQueryHeight * 0.15,
                  width: mediaQueryWidth * 0.9,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          height: mediaQueryHeight * 0.13,
                          width: mediaQueryWidth * 0.18,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: mediaQueryHeight * 0.03),
                              child: Padding(
                                padding: EdgeInsets.only(),
                                child: Text(
                                formatted,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'BerlinSansFB',
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: mediaQueryWidth * 0.05),
                              child: Text('You don\'t Have Any Occasions',
                                  style: TextStyle(
                                    fontFamily: 'BerlinSansFB',
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ),
                            Row(
                              children: [
                                IconButton(icon:
                                  Icon(Icons.add_circle_outline_rounded),
                                  color: Theme.of(context).primaryColor, onPressed: () { Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddOccasion()),
                                  );  },
                                ),
                                Text(
                                  'Add An Occasion',
                                  style: TextStyle(
                                    fontFamily: 'BerlinSansFB',
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mediaQueryHeight * 0.05,
                    left: mediaQueryWidth * 0.05,
                    right: mediaQueryWidth * 0.05,
                    bottom: mediaQueryHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shisha',
                      style:
                          TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
                    ),
                    Text(
                      'See All',
                      style:
                          TextStyle(fontFamily: 'BerlinSansFB', fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: mediaQueryHeight * 0.05),
                child: Container(
                  height: mediaQueryHeight * 0.15,
                  child: ListView.separated(
                    separatorBuilder: (context, _) => SizedBox(
                      width: mediaQueryWidth * 0.03,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => buildcard(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.05,
                    right: mediaQueryWidth * 0.05,
                    bottom: mediaQueryHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package Add-Ons',
                      style:
                          TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
                    ),
                    Text(
                      'See All',
                      style:
                          TextStyle(fontFamily: 'BerlinSansFB', fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: mediaQueryHeight * 0.05),
                child:Container(
                  height: mediaQueryHeight * 0.2,
                  child: Card(
                    elevation: 5,
                    child: ListView.separated(
                      separatorBuilder: (context, _) => SizedBox(
                        width: mediaQueryWidth * 0.03,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => buildcard1(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.05,
                    right: mediaQueryWidth * 0.05,
                    bottom: mediaQueryHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coffee & Chocolate',
                      style:
                      TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
                    ),
                    Text(
                      'See All',
                      style:
                      TextStyle(fontFamily: 'BerlinSansFB', fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: mediaQueryHeight * 0.05),
                child:Container(
                  height: mediaQueryHeight * 0.2,
                  child: Card(
                    elevation: 5,
                    child: ListView.separated(
                      separatorBuilder: (context, _) => SizedBox(
                        width: mediaQueryWidth * 0.03,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => buildcard1(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.05,
                    right: mediaQueryWidth * 0.05,
                    bottom: mediaQueryHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bands',
                      style:
                      TextStyle(fontFamily: 'BerlinSansFB', fontSize: 20),
                    ),
                    Text(
                      'See All',
                      style:
                      TextStyle(fontFamily: 'BerlinSansFB', fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: mediaQueryHeight * 0.05),
                child:Container(
                  height: mediaQueryHeight * 0.2,
                  child: Card(
                    elevation: 5,
                    child: ListView.separated(
                      separatorBuilder: (context, _) => SizedBox(
                        width: mediaQueryWidth * 0.03,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => buildcard1(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildcard() => Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white30,
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/Package1.png', fit: BoxFit.fill),
          ),
        ),
      );

  Widget buildcard1() => Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white30,
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    Image.asset('assets/images/Package1.png', fit: BoxFit.fill),
              ),
            ),
            Text('Sample',style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'BerlinSansFB'),),
            Padding(
              padding:EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005),
              child: Text('SAR 100.0',style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'BerlinSansFB'),),
            ),
          ],
        ),
      );
}
