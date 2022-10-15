import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petproject/screen/auth/registration.dart';
import 'package:petproject/screen/auth/reset_password.dart';
import 'package:petproject/screen/auth/widgets/input.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late String user;
  late String password;
  // const LogInPage({Key Key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(217, 210, 210, 100),
      child: Center(
        child: Container(
          width: 340,
          height: 337,
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
                    child: Text("Login", style: TextStyle(fontSize: 35, color: Colors.black),)
                ),
              Input(text: 'username or email', iconPath: 'assets/user.svg',),
              SizedBox(height: 5,),
              Input(text: 'password', iconPath: 'assets/block.svg',),
              Container(
                margin: EdgeInsets.only(left: 165, bottom: 5),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResetPassword()),
                    );
                  },
                  child: Text("Forgot passowrd", style: TextStyle(fontSize: 15, color: Color.fromRGBO(19, 04, 255, 100)),),
                )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: 300,
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(0, 66, 255, 100)),
                child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),
              Container(
                height: 20,
                width: 300,
                child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 177,
                    margin: EdgeInsets.only(left: 5, right: 18, top: 0),
                    child: Text("Don't have account?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),),
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text('Register', style: TextStyle(color: Color.fromRGBO(0, 66, 255, 100), fontSize: 18),)
                )
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
