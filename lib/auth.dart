import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }

  Future<void> signInWithGoogle(GoogleSignIn googleSignIn) async {
    try {
      GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user == null) {
        return;
      }
      GoogleSignInAuthentication? userAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: userAuth.accessToken,
        idToken: userAuth.idToken,
      );
      UserCredential firebaseUser =
          await _firebaseAuth.signInWithCredential(credential);
      if (firebaseUser.additionalUserInfo!.isNewUser) {
        AppFoodUser appFoodUser = AppFoodUser(
            uid: firebaseUser.user!.uid,
            username: null,
            email: firebaseUser.user!.email ?? "email boom",
            fullName: firebaseUser.user!.displayName,
            hasData: false);
        await FirebaseFirestore.instance
            .collection("users")
            .add(appFoodUser.toMap());
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

class AppFoodUser {
  AppFoodUser({
    required this.uid,
    this.username,
    required this.email,
    this.photoUrl,
    this.fullName,
    this.phoneNumber,
    required this.hasData,
  });
  String uid, email;
  String? photoUrl, fullName, phoneNumber, username;
  bool hasData;

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "photoUrl": photoUrl,
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "username": username,
      "hasData": hasData,
    };
  }
}
