import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Update extends StatefulWidget {
  // const Update({Key key}) : super(key: key);

  final String task;
  final id;
  final done;

  Update({
    required this.task,
    required this.id,
    required this.done,
  });

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController taskController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskController.text = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit task'),
      content: TextField(
        controller: taskController,
        decoration: InputDecoration(
            hintText: 'Title'
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            print("Edit: " + user.email!);
            FirebaseFirestore.instance.collection(user.email!).doc(widget.id).update({'text':taskController.text, 'done':widget.done});
            if(taskController.text.length == 0){
              FirebaseFirestore.instance.collection(user.email!).doc(widget.id).delete();
            }
            Navigator.of(context).pop();
          },
          child: Text('Edit task', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ],

    );
  }
}
