import 'dart:async';
import 'package:demo_firebase_app/ui/auth/login_screen.dart';
import 'package:demo_firebase_app/ui/posts/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if(user != null){
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const PostScreen())));

    }else{
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LoginScreen())));
    }

    
  }
}
