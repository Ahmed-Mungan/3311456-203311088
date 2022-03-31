// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class setup extends StatelessWidget {
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
                    image: AssetImage('images/setups.jpg'),
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
                        "Setups",
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
                        "3 sets of 10 to 12 reps",
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
                          "Helps in building a stronger core to reduce the chances of injury and boost one's outstanding athletic performance",
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
            "images/howtosetup.png",
            fit: BoxFit.fitWidth,
          ))
        ],
      ),
    );
  }
}
