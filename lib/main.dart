import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petproject/screen/auth/login.dart';
import 'package:petproject/screen/auth/newpassword.dart';
import 'package:petproject/screen/auth/reset_password.dart';

import 'package:petproject/screen/auth/registration.dart';
import 'package:petproject/screen/main/main_sreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB9BQUVMTxwUbRRvVbiY0cua7GGLiNzzGs",
          appId: '1:942093528081:android:9a65b0d574140a624bd5b0',
          messagingSenderId: '942093528081',
          projectId: 'petproject-d293a',
        storageBucket: 'petproject-d293a.appspot.com',
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Main(),
      )
    );
  }
}
