import 'package:elearn/views/home_page.dart';
import 'package:elearn/views/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyD1GzHZ4Sg-5BSKmrsBALcFraQaOP8X-Ok',
          appId: '1:351200080672:android:ae5005c0bf6e1bcaf3dd45',
          messagingSenderId: '351200080672',
          projectId: 'elearn-2b051'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
