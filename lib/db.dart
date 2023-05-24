import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<User> getUser() async {
  final user = FirebaseAuth.instance.currentUser;
  final userData = await FirebaseFirestore.instance
      .collection("users")
      .where("uid", isEqualTo: user!.uid)
      .get();
  final doc = userData.docs.first;
  return User(
    email: doc.get("email"),
    username: doc.get("username"),
    hasData: doc.get("hasData"),
  );
}

class User {
  final String email;
  final bool hasData;
  final String username;

  final String fullname;
  final String gender;
  final int age;
  final double weight;
  final double height;
  final String career;
  final String chronicDisease;
  final String foodAllergy;

  User({
    required this.email,
    required this.username,
    required this.hasData,
    this.fullname = "",
    this.gender = "",
    this.age = 0,
    this.weight = 0,
    this.height = 0,
    this.career = "",
    this.chronicDisease = "",
    this.foodAllergy = "",
  });
}
