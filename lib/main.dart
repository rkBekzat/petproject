import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petproject/screen/auth/login.dart';
import 'package:petproject/screen/auth/newpassword.dart';
import 'package:petproject/screen/auth/reset_password.dart';

import 'package:petproject/screen/auth/registration.dart';
import 'package:petproject/screen/main/main_sreen.dart';
import 'package:petproject/utils/get_error.dart';

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

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasError){
              return Center(child: Text('Something, wrong'),);
            }
            else if(snapshot.hasData){
              return Main();
            }
            else {
              return LogInPage();
            }
          },
      ),
      )
    );
  }
}
