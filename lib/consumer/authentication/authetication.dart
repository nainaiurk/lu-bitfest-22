// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';

class Authetication{

  static Future signUp({required String email, required String password}) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    }
    on FirebaseAuthException catch(e){
     return e.message;
    }
  }

  static Future signIn({required String email,  required String password}) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  static Future signOut() async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut();
  }


  static var authHandler= FirebasePhoneAuthHandler(
    phoneNumber: "+8801640741889",
    // If true, the user is signed out before the onLoginSuccess callback is fired when the OTP is verified successfully.
    signOutOnSuccessfulVerification: false,
    
    linkWithExistingUser: false,
    builder: (context, controller) {
      return SizedBox.shrink();
    },
    onLoginSuccess: (userCredential, autoVerified) {
      debugPrint("autoVerified: $autoVerified");
      debugPrint("Login success UID: ${userCredential.user?.uid}");
    },
    onLoginFailed: (authException, stackTrace) {
      debugPrint("An error occurred: ${authException.message}");
    },
    onError: (error, stackTrace) {},
  );
}