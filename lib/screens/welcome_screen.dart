import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yoninichat/screens/login_screen.dart';
import 'package:yoninichat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../component/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      // ticker is state new
    );
    // animation = ColorTween(begin: Colors.brown, end: Color(0xFFe4cda5))
    //     .animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {
        //print(animation.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDAA91),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('assets/images/hi.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Hero(
                //   tag: 'logo',
                //   child: Container(
                //     child: Image.asset('assets/images/logo.png'),
                //     height: 60.0,
                //   ),
                // ),
                DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.brown,
                      fontFamily: 'Signatra',
                      fontWeight: FontWeight.w100,
                      fontSize: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        child: Text(
                          'Let all that you do be done in love',
                          style: GoogleFonts.mcLaren(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(' 1 Corinthians 16:14')
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RoundedButton(
                    title: 'Login',
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RoundedButton(
                      title: 'Register',
                      color: Colors.brown,
                      onPressed: () {
                        //Go to registration screen.
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
