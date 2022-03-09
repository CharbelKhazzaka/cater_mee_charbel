import 'package:cater_mee/Screens/Auth/log_in.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.only(top: mediaQueryHeight*0.05),
                    child: Image.asset('assets/images/Group 1068.png',width: mediaQueryWidth*0.6),
                  ),
          Padding(
            padding:EdgeInsets.only(top: mediaQueryHeight*0.05),
            child: Text('Sent!',style: TextStyle(fontSize: 50,fontFamily: 'BerlinSansFb',color: Colors.grey),),
          ),
                  Padding(
                    padding:  EdgeInsets.only(top: mediaQueryHeight*0.3),
                    child: ElevatedButton(

                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.2,vertical: mediaQueryHeight*0.02),
                        child: Text(
                          'Done',
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
                      onPressed: () {

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                      },
                    ),
                  ),
                ],
              ),
            ),
        )
    );
  }
}
