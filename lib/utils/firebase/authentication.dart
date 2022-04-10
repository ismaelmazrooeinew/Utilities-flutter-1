import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

/// Setup Firebase Auth in project first.
/// Add SHA-1 ad SHA-256 in google PlayStore

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
