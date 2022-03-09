import 'package:cater_mee/Screens/Auth/Sign_up.dart';
import 'package:cater_mee/Screens/Auth/reset_pass.dart';
import 'package:cater_mee/Screens/Home.dart';
import 'package:cater_mee/Screens/Introduction/Intro_screens.dart';
import 'package:flutter/material.dart';

import '../Nav_bar.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formkey = GlobalKey<FormState>();
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding:EdgeInsets.only(top: mediaQueryHeight*0.005,bottom: mediaQueryHeight*0.05),
                  child: Container(
                    height: mediaQueryHeight*0.4,
                    width: mediaQueryWidth,
                    child: Image.asset('assets/images/accepted logo cater me1-01.png'),
                  ),
                ),
                Container(
                  height: mediaQueryHeight* 0.1,
                  width: mediaQueryWidth*0.8,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)) ,
                      prefixIcon: Icon(Icons.mail_outline),
                      label: Text('Email or phone number',style: TextStyle(fontFamily: 'BerlinSansFB',fontSize: 15),),
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
                Container(
                  height: mediaQueryHeight* 0.1,
                  width: mediaQueryWidth*0.8,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1)
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                            passwordVisible ? Icons.lock_outline : Icons.lock_open_outlined),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      label: Text('Password',style: TextStyle(fontFamily: 'BerlinSansFB',fontSize: 15),),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required*';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Padding(
                        padding: EdgeInsets.only(right: mediaQueryWidth*0.08),
                        child: TextButton(
                          child: Text(
                            'Forgot password ?',
                            style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'BerlinSansFB',fontWeight: FontWeight.bold),
                          ),
                          onPressed:  () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResetPassword()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top: mediaQueryHeight*0.01),
                  child: ElevatedButton(

                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.2,vertical: mediaQueryHeight*0.02),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,fontFamily: 'BerlinSansFB',
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
                    onPressed: () {   if (!_formkey.currentState!.validate()) {
                      return;
                    }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Navigationbar(0)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: mediaQueryHeight*0.03),
                  child: InkWell(
                    child: Text(
                      "Create New Account",style: TextStyle(fontSize: 15,fontFamily: 'BerlinSansFB',fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                  ),
                ),
                Container(height: mediaQueryHeight*0.06,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
