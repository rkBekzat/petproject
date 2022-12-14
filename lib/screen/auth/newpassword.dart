import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petproject/screen/auth/widgets/input.dart';

class NewPassword extends StatelessWidget {
  // const RegisterPage({Key key}) : super(key: key);
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(217, 210, 210, 100),
      child: Center(
        child: Container(
          width: 340,
          height: 342,
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
                  child: Text("New password", style: TextStyle(fontSize: 35, color: Colors.black),)
              ),
              Input(text: 'New password', iconPath: 'assets/block.svg', control: newPassword,),
              Input(text: 'Confirm new password', iconPath: 'assets/block.svg', control:  confirmPassword,),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: 300,
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(0, 66, 255, 100)),
                child: Center(
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
