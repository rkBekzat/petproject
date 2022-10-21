import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Adding extends StatefulWidget {
  @override
  State<Adding> createState() => _AddingState();
}

class _AddingState extends State<Adding> {
  // const Adding({Key key}) : super(key: key);
  TextEditingController taskController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 225,
        width: 310,
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
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        child: Column(
          children: [
            Center(
              child: Text('Task', style: TextStyle(fontSize: 30),),
            ),
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 230,
                height: 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 66, 255, 100),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: (){
                  print("ADDING: " + user.email!);
                  FirebaseFirestore.instance.collection(user.email!).add({'text':taskController.text, 'done':false});
                },
                child: Text('Add task', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            )
          ],
        ),
      )
    );
  }
}
