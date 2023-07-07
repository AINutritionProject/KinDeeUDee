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
      print(error);
      return error.code;
    } catch (error) {
      print("Got error when create user with email & password");
      print(error);
    }

    return null;
  }

  Future<String?> sendVerificationEmail() async {
    try {
      final user = currentUser!;
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (error) {
      print(error);
      return error.code;
    } catch (error) {
      print("Got error when sending verification email");
      print(error);
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
      print("Got error when checking verified email");
      print(error);
      return false;
    }
  }

  Future<String?> resetPassword(String email) async {
    try {
      final firebaseAuth = _firebaseAuth;
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      print("Got FirebaseAuthException when try reseting paasword");
      print(error);
      return error.code;
    }

    return null;
  }

  Future<String?> signInWithUsername(String username, String password) async {
    try {
      // get email from username
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .where("username", isEqualTo: username)
              .get();
      String email = querySnapshot.docs.first.get("email");

      UserCredential firebaseUser = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(firebaseUser.user!.uid);
    } on StateError catch (error) {
      print("Doc could not be found in firestore");
      return error.message;
    } on FirebaseAuthException catch (error) {
      print("Got firebase auth error when sign in with username & password");
      print(error);
      return error.code;
    } catch (error) {
      print("Got error when sign in with username & password");
      print(error);
    }
    return null;
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
            email: firebaseUser.user!.email ?? "email boom",
            username: firebaseUser.user!.displayName,
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
