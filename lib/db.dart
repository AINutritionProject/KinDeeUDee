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
    uid: doc.get("uid"),
    email: doc.get("email"),
    username: doc.get("username"),
    hasData: doc.get("hasData"),
  );
}

Future<dynamic> updateDoc(String uid, User user) async {
  final userRef = FirebaseFirestore.instance.collection("users").doc(uid);
  final userData = user.toMap();
  userRef.update(userData).then((value) {
    print("DocumentSnapshot successfully updated!");
    return null;
  }, onError: (e) {
    print("Error updating document $e");
    return e;
  });
}

class User {
  final String uid;
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
  int activityLevel;
  int milkGlass;
  bool milkProduct;
  double bmi;
  double bmr;

  User({
    required this.uid,
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
    this.activityLevel = 1, //1,2,3
    this.milkGlass = 0,
    this.milkProduct = false,
    this.bmi = 0,
    this.bmr = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'hasData': true,
      'fullname': fullname,
      'gender': gender,
      'age': age,
      'weight': weight,
      'height': height,
      'career': career,
      'chronicDisease': chronicDisease,
      'foodAllergy': foodAllergy,
      if (extraLightActivities != null)
        'extraLightActivities': extraLightActivities!.map((e) => e.toMap()),
      if (lightActivities != null)
        'lightActivities': lightActivities!.map((e) => e.toMap()),
      if (mediumActivities != null)
        'mediumActivities': mediumActivities!.map((e) => e.toMap()),
      if (customActivities != null)
        'customActivities': customActivities!.map((e) => e.toMap()),
      'activityLevel': activityLevel,
      'milkGlass': milkGlass,
      'milkProduct': milkProduct,
      'bmi': bmi,
      'bmr': bmr,
    };
  }
}

class UserActivity {
  String activityName;
  int frequency;

  UserActivity({
    this.activityName = "",
    this.frequency = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'activityName': activityName,
      'frequency': frequency,
    };
  }
}
