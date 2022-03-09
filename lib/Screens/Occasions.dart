import 'package:flutter/material.dart';

import 'add_occasion.dart';

class Occasions extends StatefulWidget {
  const Occasions({Key? key}) : super(key: key);

  @override
  _OccasionsState createState() => _OccasionsState();
}

class _OccasionsState extends State<Occasions> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: mediaQueryHeight * 0.05),
              child: GestureDetector(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddOccasion()),
                ); },
                child: Container(
                  height: mediaQueryHeight * 0.18,
                  child: ListView.separated(
                    separatorBuilder: (context, _) => SizedBox(
                      width: mediaQueryWidth * 0.03,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => buildcard(),
                  ),
                ),
              ),
            ),
            Container(height: mediaQueryHeight*0.4),
            Center(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('NO OCCASION ADDED YET!', style: TextStyle(fontFamily: 'BerlinSansFB',fontSize: 20),)
                ],
            ),
             ),
          ],
        ),
      ),
    );
  }
  Widget buildcard() => Container(
    width: MediaQuery.of(context).size.width * 0.35,
    height: MediaQuery.of(context).size.height * 0.2,
    color: Colors.white30,
    child: Card(
      elevation: 1,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add,color: Theme.of(context).primaryColor,size: 40,),
            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
              child: Text('Add Occasion',style: TextStyle(fontFamily: 'BerlinSansFB',fontSize: 18),),
            )
          ],
        )
    ),
  );
}
