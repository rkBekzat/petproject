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
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
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
                        trailing: ElevatedButton.icon(
                            onPressed: () => FirebaseFirestore.instance.collection(user.email!).doc(snapshot.data!.docs[index].id).delete(),
                            icon: SvgPicture.asset('assets/rubbish.svg'),
                            label: Text(''))
                      )
                  );
                });
          }
    ));
  }
}
