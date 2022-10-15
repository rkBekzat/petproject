import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // const Main({Key key}) : super(key: key);
  List to_do = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    to_do.addAll(['buy milk', 'do Homework', 'do sport', 'learn new language', 'read the book']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: to_do.length,
          itemBuilder: (BuildContext context, int index){
            return   Card(
              elevation: 15,
              shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset('assets/box.svg'),
                    title: Text(to_do[index]),
                    trailing: SvgPicture.asset('assets/rubbish.svg'),
                  )
            );
          })
    );
  }
}
