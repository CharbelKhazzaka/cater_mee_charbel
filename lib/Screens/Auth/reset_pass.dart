import 'package:cater_mee/Screens/Auth/log_in.dart';
import 'package:cater_mee/Screens/Auth/reset_password2.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Padding(
          padding:  EdgeInsets.only(right: mediaQueryWidth*0.1),
          child: Text('Forgot Password',style: TextStyle(fontSize: 20,fontFamily: 'BerlinSansFB',color: Colors.white),),
        ),),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                Padding(
                  padding:EdgeInsets.only(top: mediaQueryHeight*0.1),
                  child: Container(
                    width: mediaQueryWidth*0.9,
                    height: mediaQueryHeight*0.08,
                    decoration: BoxDecoration(color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Text('Enter Your Email Or Your Phone Number',style: TextStyle(fontFamily: 'BerlinSansFB',fontSize: 18,color: Colors.grey),),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: mediaQueryWidth * 0.07,
                      right: mediaQueryWidth * 0.07,
                      top: mediaQueryHeight * 0.2),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      prefixIcon: Icon(Icons.mail_outline),
                      label: Text(
                        'Email Or Phone Number',
                        style: TextStyle(
                          fontFamily: 'BerlinSansFB',
                          color: Colors.grey,
                        ),
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
                Padding(
                  padding:  EdgeInsets.only(top: mediaQueryHeight*0.25),
                  child: ElevatedButton(

                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.2,vertical: mediaQueryHeight*0.02),
                      child: Text(
                        'Send',
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
                      MaterialPageRoute(builder: (context) => PasswordReset()),
                    );
                    },
                  ),
                ),
              ],)
            ),
          ),
        ),
      ),
    );
  }
}
