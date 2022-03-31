// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class squats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: size.height * .45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/squats.jpg'),
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
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        "Squats",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'OpenSans',
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "3 sets of 12-15 reps",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width * .6,
                        child: Text(
                          "Squats are ideal if you have back problems. Since they’re done while standing up and without extra weight, they won’t strain the back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Image.asset(
            "images/squating.jpg",
            fit: BoxFit.fitWidth,
          ))
        ],
      ),
    );
  }
}
