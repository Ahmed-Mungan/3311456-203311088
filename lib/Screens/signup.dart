// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/services/firebase.dart';
import 'package:myproject/services/authendication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color.fromARGB(255, 8, 70, 121)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 177, 172, 172),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(223, 0, 0, 0),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                                hintText: 'Write your Email',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 116, 116, 116)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(223, 0, 0, 0),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: TextField(
                            obscureText: true,
                            controller: password,
                            decoration: InputDecoration(
                                hintText: 'Write Your Password',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 116, 116, 116)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(223, 0, 0, 0),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: TextField(
                            obscureText: true,
                            controller: name,
                            decoration: InputDecoration(
                                hintText: 'Enter Your Name',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 116, 116, 116)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          alignment: AlignmentDirectional.centerEnd,
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5.0,
                              primary: Colors.white,
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();

                              Authendication auth = Authendication();
                              auth
                                  .signup(email.text, password.text)
                                  .then((value) {
                                pref.setString("uid", value.user!.uid);
                                print('===============  ${value.user!.uid}');
                                print('made account ');
                                userSetup(email.text, password.text, name.text,
                                    value.user!.uid);
                              }).catchError((err) {
                                print(err);
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('new account made'),
                              ));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color.fromARGB(255, 5, 5, 5),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
