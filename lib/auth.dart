import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Future reloadUser() async {
    if (currentUser != null) {
      currentUser!.reload();
    }
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }

  Future<String?> createUserWithEmailAndPassword(
      String username, password, phoneNumber, email) async {
    try {
      UserCredential firebaseUser = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      AppFoodUser appFoodUser = AppFoodUser(
        uid: firebaseUser.user!.uid,
        email: email,
        hasData: false,
        username: username,
        phoneNumber: phoneNumber,
      );
      await FirebaseFirestore.instance.collection("users").add(
            appFoodUser.toMap(),
          );
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (error) {
      return error.toString();
    }

    return null;
  }

  Future<String?> sendVerificationEmail() async {
    try {
      final user = currentUser!;
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (error) {
      return error.toString();
    }
    return null;
  }

  bool emailIsVerified() {
    try {
      final user = currentUser!;
      if (user.emailVerified) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<String?> resetPassword(String email) async {
    try {
      final firebaseAuth = _firebaseAuth;
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      return error.code;
    }

    return null;
  }

  Future<String?> signInWithUsername(String username, String password) async {
    try {
      if (username.contains("@")) {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: username, password: password);
      } else {
        // get email from username
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection("users")
                .where("username", isEqualTo: username)
                .get();
        String email = querySnapshot.docs.first.get("email");

        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } on StateError catch (error) {
      return error.message;
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (error) {
      return error.toString();
    }
    return null;
  }

  Future<String?> signInWithGoogle(GoogleSignIn googleSignIn) async {
    try {
      GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user == null) {
        return null;
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
            email: firebaseUser.user!.email!,
            username: firebaseUser.user!.displayName,
            hasData: false);
        await FirebaseFirestore.instance
            .collection("users")
            .add(appFoodUser.toMap());
      }
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (error) {
      return error.toString();
    }
    return null;
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
    this.phoneNumber,
    required this.hasData,
  });
  String uid, email;
  String? photoUrl, phoneNumber, username;
  bool hasData;

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "phoneNumber": phoneNumber,
      "username": username,
      "hasData": hasData,
    };
  }
}
