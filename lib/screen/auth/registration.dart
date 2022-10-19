import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petproject/main.dart';
import 'package:petproject/screen/auth/widgets/input.dart';

import '../../utils/get_error.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // const RegisterPage({Key key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future signUp() async {
    final isvalid = formKey.currentState!.validate();

    if(!isvalid) return

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey..currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(217, 210, 210, 100),
      child: Center(
        child: Container(
          key: formKey,
          width: 340,
          height: 380,
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical:20),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 5, bottom: 27, top: 0),
                  child: Text("Sign up", style: TextStyle(fontSize: 35, color: Colors.black),)
              ),
              Input(text: 'username', iconPath: 'assets/user.svg', control: userNameController,),
              SizedBox(height: 13,),
              Input(text: 'Email', iconPath: 'assets/message.svg', control: emailController,),
              SizedBox(height: 13,),
              Input(text: 'password', iconPath: 'assets/block.svg', control: passwordController,),
              SizedBox(height: 13,),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: 300,
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(0, 66, 255, 100)),
                child: ElevatedButton(
                  onPressed: signUp,
                  child: Text("Sign up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),
            ],
          ),
        ),
      ),
        )
    );
  }
}
