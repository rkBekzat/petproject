import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petproject/screen/main/main_sreen.dart';
// import 'packagefirebase_auth_verify_email/page/'
import '../../utils/get_error.dart';
import 'dart:async';

class VerifyPage extends StatefulWidget {
  // const VerifyPage({Key key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified){
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerifid(),
      );
    }


  }

  Future checkEmailVerifid() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Future sendVerificationEmail() async{
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e){
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Main()
      : Scaffold(
    appBar: AppBar(
      title: Text("Verify Email"),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text('A verification email has been sent to your  email'),
          SizedBox(height: 24,),
          ElevatedButton(
              onPressed: canResendEmail ?  sendVerificationEmail : () {},
              child: Text("Resent")),
          SizedBox(height: 8,),
          TextButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text('Cancel'))
        ],
      ),
    ),
  );
}
