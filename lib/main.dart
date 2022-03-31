// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/chest.dart';
import 'package:myproject/setups.dart';
import 'package:myproject/signup.dart';
import 'package:myproject/squats.dart';
import 'package:myproject/pullup.dart';
import 'package:myproject/util';
import 'forgot.dart';
import 'mainpage.dart';
import 'info.dart';
import 'forgot2.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/nextPage': ((context) => forgot()),
      '/mainpage': ((context) => mainpage()),
      '/signuppage': ((context) => Signup()),
      '/infopage': ((context) => Info()),
      '/forgot2': ((context) => forgot2()),
      '/chest': ((context) => chest()),
      '/squats': ((context) => squats()),
      '/setup': ((context) => setup()),
      '/pullup': ((context) => pullup()),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  createAlertDialogue(BuildContext context) {
    TextEditingController customeController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("  Your NAme"),
            content: TextField(
              controller: customeController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('submit'),
                onPressed: () {},
              )
            ],
          );
        });
  }

  bool _rememberMe = false;
  Widget _emailBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email Address',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Write your email here',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

// password box
  Widget _passWordBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Write your Password here',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _forgotPasswordButton(BuildContext ctx) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          'Forgot Password',
          style: kLabelStyle,
        ),
        // ignore: avoid_print
        onPressed: () {
          Navigator.pushNamed(ctx, '/nextPage');
        },
      ),
    );
  }

  Widget _rememberMeCheck() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 30.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember Me',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _infoButton(BuildContext context) {
    return Container(
      alignment: FractionalOffset.bottomCenter,
      child: TextButton(
        child: Text(
          'Info',
          style: kLabelStyle,
        ),
        // ignore: avoid_print
        onPressed: () {
          Navigator.pushNamed(context, '/infopage');
        },
      ),
    );
  }

  Widget _loginButtonn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.pushNamed(context, '/mainpage');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            color: Color.fromARGB(255, 23, 23, 24),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _signUpbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.pushNamed(context, '/signuppage');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Sign up',
          style: TextStyle(
            color: Color.fromARGB(255, 23, 23, 24),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background1.jpeg'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //user photo

                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/default.jpg'),
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 28.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _emailBox(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _passWordBox(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _forgotPasswordButton(context),
                    _rememberMeCheck(),
                    _loginButtonn(),
                    _signUpbutton(),
                    _infoButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
