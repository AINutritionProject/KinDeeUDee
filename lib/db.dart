import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<User> getUser() async {
  final user = FirebaseAuth.instance.currentUser;
  final userData = await FirebaseFirestore.instance
      .collection("users")
      .where("uid", isEqualTo: user!.uid)
      .get();
  final doc = userData.docs.first;
  if (doc.get("hasData") == true) {
    return User(
      docID: doc.id,
      uid: doc.get("uid"),
      email: doc.get("email"),
      username: doc.get("username"),
      hasData: doc.get("hasData"),
      fullname: doc.get("fullname"),
      gender: doc.get("gender"),
      age: doc.get("age"),
      weight: doc.get("weight"),
      height: doc.get("height"),
      career: doc.get("career"),
      chronicDisease: doc.get("chronicDisease"),
      foodAllergy: doc.get("foodAllergy"),
      extraLightActivities:
          activityListFromMap(doc.get("extraLightActivities")),
      lightActivities: activityListFromMap(doc.get("lightActivities")),
      mediumActivities: activityListFromMap(doc.get("mediumActivities")),
      customActivities: activityListFromMap(doc.get("customActivities")),
      activityInputTime: doc.get("activityInputTime"),
      saveActivity: doc.get("saveActivity"),
      activityLevel: doc.get("activityLevel"),
      milkGlass: doc.get("milkGlass"),
      milkProduct: doc.get("milkProduct"),
      bmi: doc.get("bmi"),
      bmr: doc.get("bmr"),
    );
  }
  return User(
    docID: doc.id,
    uid: doc.get("uid"),
    email: doc.get("email"),
    username: doc.get("username"),
    hasData: doc.get("hasData"),
  );
}

Future<bool> updateDoc(User user) async {
  final userRef =
      FirebaseFirestore.instance.collection("users").doc(user.docID);
  final userData = user.toMap();
  try {
    await userRef.update(userData);
  } catch (e) {
    print(e);
    return false;
  }
  print("write to doc success");
  return true;
}

Future<bool> updateActivityDoc(User user) async {
  final userRef =
      FirebaseFirestore.instance.collection("users").doc(user.docID);
  final userData = user.toActivityMap();
  try {
    await userRef.update(userData);
  } catch (e) {
    print(e);
    return false;
  }
  print("write to doc success");
  return true;
}

class User {
  final String docID;
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
  int activityInputTime;
  bool saveActivity;
  int activityLevel;
  int milkGlass;
  bool milkProduct;
  double bmi;
  double bmr;

  User({
    required this.docID,
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
    this.activityInputTime = 0,
    this.saveActivity = false,
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
      'saveActivity': saveActivity,
      'activityInputTime': activityInputTime,
      'activityLevel': activityLevel,
      'milkGlass': milkGlass,
      'milkProduct': milkProduct,
      'bmi': bmi,
      'bmr': bmr,
    };
  }

  Map<String, dynamic> toActivityMap() {
    return {
      if (extraLightActivities != null)
        'extraLightActivities': extraLightActivities!.map((e) => e.toMap()),
      if (lightActivities != null)
        'lightActivities': lightActivities!.map((e) => e.toMap()),
      if (mediumActivities != null)
        'mediumActivities': mediumActivities!.map((e) => e.toMap()),
      if (customActivities != null)
        'customActivities': customActivities!.map((e) => e.toMap()),
      'saveActivity': saveActivity,
      'activityInputTime': activityInputTime,
      'activityLevel': activityLevel,
    };
  }
}

class UserActivity {
  String activityName;
  int frequency;

  UserActivity({
    this.activityName = "",
    this.frequency = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'activityName': activityName,
      'frequency': frequency,
    };
  }
}

List<UserActivity>? activityListFromMap(List<dynamic>? activityListMap) {
  if (activityListMap != null) {
    List<UserActivity> userActivities = [];
    for (int i = 0; i < activityListMap.length; i++) {
      userActivities.add(UserActivity(
        frequency: activityListMap[i]["frequency"],
        activityName: activityListMap[i]["activityName"],
      ));
    }
    return userActivities;
  }
  return null;
}

Future<Map<String, List<String>>> getUsernamesAndEmails() async {
  final querySnapshot =
      await FirebaseFirestore.instance.collection('users').get();
  List<String> usernames = [];
  List<String> emails = [];
  for (var docSnapshot in querySnapshot.docs) {
    usernames.add(docSnapshot.get("username"));
    emails.add(docSnapshot.get("email"));
  }

  return {"usernames": usernames, "emails": emails};
}
