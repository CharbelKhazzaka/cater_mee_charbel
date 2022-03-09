import 'package:cater_mee/Screens/Auth/log_in.dart';
import 'package:cater_mee/main.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Intro extends StatefulWidget {

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: mediaQueryHeight * 0.1),
          child: PageView(
            controller: controller,
            children: [
              Image.asset('assets/images/new intro-02.png'),
              Image.asset('assets/images/new intro-02.png'),
          Image.asset('assets/images/new new new-01.png'),
                 Image.asset('assets/images/new new-01.png'),
              // ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
         height: mediaQueryHeight*0.1,
          child: Center(
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        width: mediaQueryWidth * 0.05),
                    dotDecoration: DotDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(16)),
                  ),
                  onDotClicked: (index)=>controller.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn),
                ),
                TextButton(onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome',true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );}, child: Text('Get Started',style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'BerlinSansFB',fontSize: 20),))
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildPage({required Color color,required String image}) {}
}
