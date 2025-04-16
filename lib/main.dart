import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_new_project/firebase_options.dart';
import 'package:firebase_new_project/login_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LoginPage(),
    );
  }
}
