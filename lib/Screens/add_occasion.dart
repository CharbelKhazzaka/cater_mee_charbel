import 'package:cater_mee/Screens/Occasions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Nav_bar.dart';

class AddOccasion extends StatefulWidget {
  const AddOccasion({Key? key}) : super(key: key);

  @override
  _AddOccasionState createState() => _AddOccasionState();
}

class _AddOccasionState extends State<AddOccasion> {
  late TextEditingController controller;
  final occasions = [
    'Add occasion'
        'Birthday',
    'Iftar Ramadan',
    'New Year',
    'Valentine\'s day',
  ];

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  void initState() {
    controller = TextEditingController(text: occasions[index]);
  }

  final _formkey = GlobalKey<FormState>();

  int index = 0;
  late DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(selectedDate);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    void showOccasionPicker() {
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(actions: [
                Container(
                  height: mediaQueryHeight * 0.5,
                  child: CupertinoPicker(
                    itemExtent: 60,
                    onSelectedItemChanged: (index) {
                      setState(() => this.index = index);
                      final occasion = occasions[index];
                      controller.text = occasion;
                      print('$occasion');
                    },
                    children: occasions
                        .map((occasion) => Center(
                              child: Text(
                                occasion,
                                style: TextStyle(
                                    fontFamily: 'BerlinSansFB',
                                    color: Theme.of(context).primaryColor),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ]));
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Center(
              child: Text(
            'Add An Occasion',
            style: TextStyle(color: Colors.white, fontFamily: 'BerlinSansFB'),
          )),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: mediaQueryHeight * 0.1,
                    ),
                    child: Container(
                      height: mediaQueryHeight * 0.1,
                      width: mediaQueryWidth * 0.9,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text(
                            'Name of Occasion',
                            style: TextStyle(
                                fontFamily: 'BerlinSansFB',
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required*';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showOccasionPicker();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      height: mediaQueryHeight * 0.08,
                      width: mediaQueryWidth * 0.9,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: mediaQueryWidth * 0.005),
                              child: Text(
                                occasions[index],
                                style: TextStyle(
                                    fontFamily: 'BerlinSansFB',
                                    color: Colors.grey),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePicker();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: mediaQueryHeight * 0.03),
                      child: Container(
                        height: mediaQueryHeight * 0.08,
                        width: mediaQueryWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: mediaQueryWidth * 0.03,
                              left: mediaQueryWidth * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Dd / Mm / Yyyy',
                                style: TextStyle(
                                  fontFamily: 'BerlinSansFB',
                                  color: Colors.grey,
                                ),
                              ),
                              Text(formatted == null ? "" : "$formatted"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: mediaQueryHeight * 0.3),
                    child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQueryWidth * 0.2,
                            vertical: mediaQueryHeight * 0.02),
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'BerlinSansFB',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navigationbar(1)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showDatePicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                if (value != null && value != selectedDate)
                  setState(() {
                    selectedDate = value;
                  });
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1940,
              maximumYear: 2022,
            ),
          );
        });
  }
}
