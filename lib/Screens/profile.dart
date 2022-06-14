// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/models/user.dart';
import 'package:myproject/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final uid = ModalRoute.of(context)!.settings.arguments as String;
    //var uid = '';
    final ImagePicker _picker = ImagePicker();
    File? pickedImage;
    fetchImage() async {
      final image = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 60);
      if (image == null) {
        return;
      }

      setState(() {
        pickedImage = File(image.path);
      });
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child('${uid}.jpg');

      ///
      ////
      var urlImage;
      if (pickedImage != null) {
        await ref.putFile(pickedImage!);
        urlImage = await ref.getDownloadURL();
        await ref.putFile(pickedImage!);
      } else {
        urlImage =
            'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png';
      }
      await FirebaseFirestore.instance
          .collection('Accounts')
          .doc('${uid}')
          .collection('User')
          .doc('Inf')
          .update({
        'image_url': urlImage,
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 9, 56, 132),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('/Accounts/${uid}/User/')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              List<DocumentSnapshot> s2 = snapshot.data!.docs;
              return Container(
                padding: EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 25),
                          GestureDetector(
                            onTap: fetchImage,
                            child: s2[0]['image_url'] == ''
                                ? CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage:
                                        AssetImage('images/default.jpg'),
                                  )
                                : CircleAvatar(
                                    radius: 50.0,
                                    child:
                                        Image.network('${s2[0]['image_url']}')),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 20,
                            thickness: 5,
                            indent: 20,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              await showDialogWithBio('${uid}');
                            },
                            child: Text(
                              "${s2[0]['name']}",
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 38.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  String yourName = '';
  Future showDialogWithBio(String userId) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(104, 20, 53, 216),
        title: Text(
          'Enter New Name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        content: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'New Name',
            label: Text('New Name'),
            border: OutlineInputBorder(),
          ),
          maxLength: 100,
          onChanged: (value) {
            setState(() {
              yourName = value;
            });
          },
        ),
        actions: [
          OutlinedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('Accounts')
                  .doc('${userId}')
                  .collection('User')
                  .doc('Inf')
                  .update({
                'name': yourName,
              });

              Navigator.of(context).pop();
            },
            child: Text(
              'Submit',
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
