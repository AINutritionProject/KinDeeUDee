import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<QueryDocumentSnapshot> getUser() async {
  final user = FirebaseAuth.instance.currentUser;
  final userData = await FirebaseFirestore.instance
      .collection("users")
      .where("uid", isEqualTo: user!.uid)
      .get();
  return userData.docs.first;
}

class User {}
