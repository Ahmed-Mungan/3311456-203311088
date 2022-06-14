// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myproject/Screens/chest.dart';
import 'package:myproject/Screens/profile.dart';
import 'package:myproject/Screens/chartpage.dart';
import 'package:myproject/unused/food_page.dart';
import 'package:myproject/services/authendication.dart';
import 'package:myproject/Screens/setups.dart';
import 'package:myproject/Screens/signup.dart';
import 'package:myproject/Screens/squats.dart';
import 'package:myproject/Screens/pullup.dart';
import 'package:myproject/utilities';
import 'package:myproject/viewmodel/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/forgot.dart';
import 'Screens/mainpage.dart';
import 'Screens/info.dart';
import 'Screens/forgot2.dart';
import 'Screens/buttons.dart';
import 'Screens/usermodel.dart';
import 'dosya.dart';
import 'download.dart';

import 'package:fl_chart/fl_chart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(),
      ),
    ],
    child: MaterialApp(
      // home: FoodPage(),
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
        '/buttonpage': ((context) => buttonpage()),
        '/UserPage': ((context) => UserPage()),
        '/profile': ((context) => profile()),
        '/FileOperationsScreen': ((context) => FileOperationsScreen()),
        '/LineChartSample2': ((context) => LineChartSample2()),
      },
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  List<String> getErrorMessage = [
    '',
    '                 your password or email is empty'
  ];
  int count = 0;
  createAlertDialogue(BuildContext context) {
    TextEditingController customeController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("  Your Name"),
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
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxStyle,
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
              hintStyle:
                  TextStyle(color: Colors.white54, fontFamily: 'OpenSans'),
            ),
            controller: email,
            onSubmitted: (index) {
              print('Your E-mail -: ' + index.toString());
            },
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
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxStyle,
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
              hintStyle:
                  TextStyle(color: Colors.white54, fontFamily: 'OpenSans'),
            ),
            controller: pass,
            onSubmitted: (index) {
              print('Your Password -: ' + index.toString());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            getErrorMessage[count],
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _forgotPasswordButton(BuildContext ctx) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          'Forgot Password',
          style: labelStyle,
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
            style: labelStyle,
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
          style: labelStyle,
        ),
        // ignore: avoid_print
        onPressed: () {
          Navigator.pushNamed(context, '/infopage');
        },
      ),
    );
  }

  Widget _userPage(BuildContext context) {
    return Container(
      alignment: FractionalOffset.bottomCenter,
      child: TextButton(
        child: Text(
          'userlist',
          style: labelStyle,
        ),
        // ignore: avoid_print
        onPressed: () {
          Navigator.pushNamed(context, '/UserPage');
        },
      ),
    );
  }

  Widget _loginButtonn() {
    Authendication _auth = Authendication();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          primary: Color.fromARGB(255, 255, 224, 224),
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          _auth.loginWithEmailAndPassword(email.text, pass.text).then((value) {
            print(value);
            pref.setString("uid", value.user!.uid);

            Navigator.pushNamed(context, '/mainpage',
                arguments: value.user!.uid);
          }).catchError((err) {
            print(err);
          });
          // setState(() {
          //   // if (email.text.isEmpty || pass.text.isEmpty) {
          //   //   count = 1;
          //   // } else {
          //   //   count = 0;
          //   //   Navigator.pushNamed(context, '/mainpage');
          //   // }
          // });
        },
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/signuppage');
        },
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

  Widget _buttonPage() {
    return Container(
      alignment: FractionalOffset.bottomCenter,
      child: TextButton(
        child: Text(
          'Buttons',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        // ignore: avoid_print
        onPressed: () {
          Navigator.pushNamed(context, '/buttonpage');
        },
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
                    //-------------------------//
                    //user photo
                    //----------------------//
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/default.jpg'),
                    ),
                    //-------------------------//
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
                    _buttonPage(),
                    _userPage(context),
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
