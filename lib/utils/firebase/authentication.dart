import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Setup Firebase Auth in project first.

Future<void> signInByGoogle({
  required Function(GoogleSignInAccount, UserCredential) onSignIn,
  required VoidCallback onCancel,
}) async {
  final GoogleSignInAccount? account = await GoogleSignIn().signIn();
  if (account == null) {
    onCancel();
    return;
  }

  final GoogleSignInAuthentication googleAuth = await account.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  onSignIn(account, userCredential);
}
