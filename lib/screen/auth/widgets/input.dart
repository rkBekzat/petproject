import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Input extends StatefulWidget {
  // const Input({Key key}) : super(key: key);


  final String iconPath;
  final String text;
  TextEditingController control;

  Input({
    required this.iconPath,
    required this.text,
    required this.control,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late String user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      margin: EdgeInsets.only(bottom: 7, top: 0),
      decoration: BoxDecoration(color: Color.fromRGBO(238, 232, 232, 100), borderRadius: BorderRadius.circular(10)),
      child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 13, bottom: 12, left: 6, right: 5),
          child: SvgPicture.asset(widget.iconPath, height: 25, width: 25,),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          width: 260,
          height: 40,
          child: TextField(
            onChanged: (String value) {
              user = value;
            },
            controller: widget.control,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.text,
            ),
          ),
        ),
      ],
        ),
    );
  }
}
