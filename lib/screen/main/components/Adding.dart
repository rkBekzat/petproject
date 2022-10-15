import 'package:flutter/material.dart';

class Adding extends StatelessWidget {
  // const Adding({Key key}) : super(key: key);

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
              child: Center(
                child: Text('Add task', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            )
          ],
        ),
      )
    );
  }
}
