import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> userSetup(
    String displayname, String passowrd, String name, String uid) async {
  var users = FirebaseFirestore.instance
      .collection('Accounts')
      .doc('${uid}')
      .collection('User')
      .doc('Inf');
  FirebaseAuth auth = FirebaseAuth.instance;
  // String uid = auth.currentUser!.uid.toString();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setString('idKey', uid);
  users.set({
    'Email': displayname,
    'Password': passowrd,
    'name': name,
    'image_url': ''
  });
  return;
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:myproject/models/user.dart';

// class FirebaseService {
//   Stream<List<UserModel>> readUser() {
//     return FirebaseFirestore.instance.collection("users").snapshots().map(
//         (event) =>
//             event.docs.map((e) => UserModel.fromFirestore(e.data())).toList());
//   }
// }
