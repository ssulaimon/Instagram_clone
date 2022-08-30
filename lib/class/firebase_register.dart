import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final String? email;
  final String? password;
  final String? username;
  Authentication({
    this.email,
    this.password,
    this.username,
  });

  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
//Creating account functioni
  Future<String?> createAccount() async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      User? user = result.user;
      if (user != null) {
        await user.updateDisplayName(username);
        await user.reload();
        user = auth.currentUser;

        return null;
      }
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    }
    return null;
  }
  //Login to your account function

  Future<String?> loginToAccount() async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      log(user.user!.displayName.toString());
      return null;
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }
  // Log out account fucncton

  Future<String> logout() async {
    try {
      var user = await FirebaseAuth.instance.signOut();
      return 'done';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  // Forget account function

  Future<String?> forgetPassword() async {
    try {
      var user =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  //get curren account username

  String? get userName => auth.currentUser!.displayName;
  String? get profilePic => auth.currentUser?.photoURL;
}
