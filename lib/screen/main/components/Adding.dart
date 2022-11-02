import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petproject/utils/get_error.dart';

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
    return  AlertDialog(
        title: Text('Add task'),
        content: TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
        actions: [
          ElevatedButton(
            onPressed: (){
              print("ADDING: " + user.email!);
              if(taskController.text.length == 0){
                Utils.showSnackBar("Empty task not accept");
              }
              else {
                FirebaseFirestore.instance.collection(user.email!).add(
                    {'text': taskController.text, 'done': false});
              }
              Navigator.of(context).pop();
            },
            child: Text('Add task', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
          ),
        ],

    );
  }
}
