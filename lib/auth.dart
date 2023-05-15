import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      GoogleSignInAuthentication? userAuth = await user?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: userAuth?.accessToken,
        idToken: userAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
