import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petproject/screen/auth/widgets/input.dart';
import 'package:petproject/utils/get_error.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // const RegisterPage({Key key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  Future reset() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child:  CircularProgressIndicator(),));

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim()
      );
      Utils.showSnackBar("Password reset email sent");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e){
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(217, 210, 210, 100),
      child: Center(
        child: Container(
          width: 340,
          height: 215,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(3,4),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical:20)  ,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 5, bottom: 20, top: 0),
                  child: Text("Forgot password?", style: TextStyle(fontSize: 25, color: Colors.black),)
              ),
              Input(text: "Email", iconPath: 'assets/message.svg', control: emailController,),
              Container(
                margin: EdgeInsets.only(top: 13),
                width: 300,
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(0, 66, 255, 100)),
                child: ElevatedButton(
                  onPressed: reset,
                  child: Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
