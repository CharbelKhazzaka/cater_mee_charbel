import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cater_mee/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontFamily: 'BerlinSansFB', color: Colors.grey, fontSize: 15),
      ),
    );

class _SignupState extends State<Signup> {
  final genders = [
    'Male',
    'Female',
  ];
  File? image;

  String? value;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  bool _validate = false;

  final _email = TextEditingController();
  final _name = TextEditingController();
  final _gender = TextEditingController();
  final _birthdate = TextEditingController();
  final _phone = TextEditingController();

  late DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final String formatted = formatter.format(selectedDate);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: mediaQueryHeight * 0.02),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: GestureDetector(
                    child: CircleAvatar(
                      minRadius: 50,
                      backgroundColor: Colors.white,
                      child: image != null
                          ? ClipOval(
                              child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ))
                          : Icon(Icons.perm_identity_outlined,
                              color: Colors.green,
                              size: mediaQueryWidth * 0.12),
                    ),
                    onLongPress: () => pickImage(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mediaQueryHeight * 0.05,
                    left: mediaQueryWidth * 0.1,
                    right: mediaQueryWidth * 0.1,
                    bottom: mediaQueryHeight * 0.03),
                child: Container(
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      prefixIcon: Icon(Icons.perm_identity),
                      label: Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'BerlinSansFB',
                          color: Colors.grey,
                        ),
                      ),
                      errorText: _validate ? 'Required' : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.1,
                    right: mediaQueryWidth * 0.1,
                    bottom: mediaQueryHeight * 0.03),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    prefixIcon: Icon(Icons.mail_outline),
                    label: Text(
                      'Email',
                      style: TextStyle(
                        fontFamily: 'BerlinSansFB',
                        color: Colors.grey,
                      ),
                    ),
                    errorText: _validate ? 'Required' : null,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.1,
                    right: mediaQueryWidth * 0.1,
                    bottom: mediaQueryHeight * 0.03),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    prefixIcon: Icon(Icons.phone),
                    label: Text('Phone number',
                        style: TextStyle(
                          fontFamily: 'BerlinSansFB',
                          color: Colors.grey,
                        )),
                    errorText: _validate ? 'Required' : null,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.1,
                    right: mediaQueryWidth * 0.1,
                    bottom: mediaQueryHeight * 0.03),
                child: TextFormField(
                  controller: _birthdate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    prefixIcon: Icon(Icons.lock_outline),
                    label: Text('Password',
                        style: TextStyle(
                          fontFamily: 'BerlinSansFB',
                          color: Colors.grey,
                        )),
                    errorText: _validate ? 'Required' : null,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.1,
                    right: mediaQueryWidth * 0.1,
                    bottom: mediaQueryHeight * 0.02),
                child: TextFormField(
                  controller: _birthdate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    prefixIcon: Icon(Icons.lock_outline),
                    label: Text('Confirm Password',
                        style: TextStyle(
                          fontFamily: 'BerlinSansFB',
                          color: Colors.grey,
                        )),
                    errorText: _validate ? 'Required' : null,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryWidth * 0.1,
                    right: mediaQueryWidth * 0.1,
                    bottom: mediaQueryHeight * 0.01),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.1,vertical: mediaQueryHeight*0.005),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 0.5),
                    color: Colors.white
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text('Gender',style: TextStyle(color: Colors.grey,fontFamily: 'BerlinSansFB',)),
                      value: value,
                      iconSize: 30,
                      icon: Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,
                      items: genders.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(
                        () => this.value = value,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: mediaQueryHeight*0.02,
                    left: mediaQueryWidth * 0.1,
                    right: mediaQueryWidth * 0.1,
                    bottom: mediaQueryHeight * 0.06),
                child: GestureDetector(
                  onTap: () {
                    showDatePicker();
                  },
                  child: Container(
                    height: mediaQueryHeight * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
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
                            'Birthdate',
                            style: TextStyle(
                              fontFamily: 'BerlinSansFB',
                              color: Colors.grey,
                            ),
                          ),
                          Text(formatted == null ? "" : "$formatted"),
                          Icon(Icons.keyboard_arrow_down_outlined),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryWidth * 0.2,
                      vertical: mediaQueryHeight * 0.015),
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'BerlinSansFB'),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _name.text.isEmpty ? _validate = true : _validate = false;
                    _email.text.isEmpty ? _validate = true : _validate = false;
                    _phone.text.isEmpty ? _validate = true : _validate = false;
                    _birthdate.text.isEmpty
                        ? _validate = true
                        : _validate = false;
                    _gender.text.isEmpty ? _validate = true : _validate = false;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: mediaQueryWidth * 0.15),
                child: Row(
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: 'BerlinSansFB'),
                    ),
                    TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'BerlinSansFB'),
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
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
