// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .40,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/background2.jpeg'),
              ),
              color: Colors.black,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      iconSize: 45,
                      onPressed: () {
                        print('settings pressed');
                      },
                    ),
                  ),
                  Text(
                    "Start Today\nIt's Never Too Late",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      children: <Widget>[
                        //Back Workout //
                        //-----------------------------//
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, '/pullup'),
                            child: Column(
                              children: <Widget>[
                                Spacer(),
                                Image.asset('images/backmuscle.jpg',
                                    fit: BoxFit.cover),
                                Spacer(),
                                Text(
                                  "Back Workouts",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //-----------------------------------------//
                        //-----------------------------------------//
                        //chest workout//
                        //--------------------------------------//
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, '/chest'),
                            child: Column(
                              children: <Widget>[
                                Spacer(),
                                Image.asset('images/chestmuscle.jpg',
                                    fit: BoxFit.cover),
                                Spacer(),
                                Text(
                                  "Chest Workouts",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //----------------------------------//
                        //-----------------------------------------//
                        //legs//
                        //-----------------------//
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, '/squats'),
                            child: Column(
                              children: <Widget>[
                                Spacer(),
                                Image.asset('images/legmuscle.jpg',
                                    fit: BoxFit.cover),
                                Spacer(),
                                Text(
                                  "Leg Workouts",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //-----------------------------------------//
                        //-----------------------------------------//
                        //abdomen//
                        //--------------------------------//
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, '/setup'),
                            child: Column(
                              children: <Widget>[
                                Spacer(),
                                Image.asset('images/abdomen.jpg',
                                    fit: BoxFit.cover),
                                Spacer(),
                                Text(
                                  "Abdomen Workout",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //---------------------------------------//
                            //------------------------------//
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
