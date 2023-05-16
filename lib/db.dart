import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<User> getUser() async {
  final user = FirebaseAuth.instance.currentUser;
  final userData = await FirebaseFirestore.instance
      .collection("users")
      .where("uid", isEqualTo: user!.uid)
      .get();
  final doc = userData.docs.first;
  return User(doc.get("email"), doc.get("username"), doc.get("hasData"));
}

class User {
  final String email;
  final bool hasData;
  final String username;

  User(this.email, this.username, this.hasData);
}
