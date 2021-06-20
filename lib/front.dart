import 'package:flutter/material.dart';
import 'package:yoninichat/component/rounded_button.dart';
import 'package:yoninichat/screens/welcome_screen.dart';

class FirstPage extends StatefulWidget {
  static String id = 'first_page';
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.pushNamed(context, WelcomeScreen.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.cover,
        image: AssetImage('assets/images/bg.png'),
      )),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                height: 100.0,
                image: AssetImage('assets/images/logo.png'),
              ),
              Text(
                'We are better togather',
                style: TextStyle(
                    fontFamily: 'Signatra',
                    fontSize: 30,
                    fontWeight: FontWeight.w100),
              ),
              // RoundedButton(
              //   title: 'Get started',
              //   color: Colors.brown,
              //   onPressed: () {
              //     Navigator.pushNamed(context, WelcomeScreen.id);
              //   },
              // )
            ]),
      ),
    ));
  }
}
