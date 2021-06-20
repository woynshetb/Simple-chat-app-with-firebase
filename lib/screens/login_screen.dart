import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoninichat/constants.dart';
import 'package:yoninichat/screens/chat_screen.dart';
import '../component/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  UserCredential userCredential;
  String oldUser;
  String oldPass;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.brown),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.brown,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Flexible(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  'Welcome back ! ',
                  style: GoogleFonts.mcLaren(),
                  textScaleFactor: 3,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  oldUser = value;
                },
                decoration: KTextFieldDecoretion.copyWith(
                  hintText: 'Enter Email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    oldPass = value;
                  },
                  decoration: KTextFieldDecoretion.copyWith(
                    hintText: 'Enter A Password',
                  )),
              SizedBox(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password ?',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
              RoundedButton(
                  title: 'Confirm',
                  color: Color(0xFF2C2F3A),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      userCredential = await _auth.signInWithEmailAndPassword(
                        email: oldUser,
                        password: oldPass,
                      );
                      final user = userCredential;
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
              SizedBox(
                height: 15,
              ),
              SvgPicture.asset(
                'assets/images/undraw_Messaging_app_re_aytg.svg',
                width: 400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
