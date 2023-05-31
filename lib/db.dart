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

  String fullname;
  String gender;
  int age;
  double weight;
  double height;
  String career;
  String chronicDisease;
  String foodAllergy;
  List<UserActivity>? extraLightActivities;
  List<UserActivity>? lightActivities;
  List<UserActivity>? mediumActivities;
  List<UserActivity>? customActivities;

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
    this.extraLightActivities,
    this.lightActivities,
    this.mediumActivities,
    this.customActivities,
  });
}

class UserActivity {
  String activityName;
  int frequency;

  UserActivity({
    this.activityName = "",
    this.frequency = 0,
  });
}
