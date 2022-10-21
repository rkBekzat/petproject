import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petproject/model/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // const Main({Key key}) : super(key: key);
  List<Task> to_do = [];
  final user = FirebaseAuth.instance.currentUser!;

  void initFirbase() async{

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // to_do.addAll(['buy milk', 'do Homework', 'do sport', 'learn new language', 'read the book']);
  }

  @override
  Widget build(BuildContext context) {
    print("HOME: "+user.email!);
    return Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(user.email!).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print("IS it start?");
            if(!snapshot.hasData) return Text("You haven't task");
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return  Card(
                    // key: Key(snapshot.data!.docs[index].id),
                      elevation: 15,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset('assets/box.svg'),
                        title: Text(snapshot.data!.docs[index].get('text')),
                        trailing: SvgPicture.asset('assets/rubbish.svg'),
                      )
                  );
                });
          }
    ));
  }
}
