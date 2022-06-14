// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myproject/utilities';

class buttonpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 5, 148),
        title: Text('Button Page'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: GestureDetector(
                    child: Text(
                      'one tap',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('one tap has been pressed')));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: GestureDetector(
                    child: Text(
                      'double tap',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onDoubleTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('double tap')));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: GestureDetector(
                    child: Text(
                      'start of tap',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTapDown: (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(' on start has been tapped')));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: GestureDetector(
                    child: Text(
                      'at end of pressing',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTapUp: (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(' at end pressed')));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: GestureDetector(
                    child: Text(
                      'long press',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('long pressed')));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
