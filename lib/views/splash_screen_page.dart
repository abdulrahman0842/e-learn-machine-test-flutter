import 'dart:async';
import 'package:elearn/views/user_login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserLoginPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text("E-Learn",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ))));
  }
}
