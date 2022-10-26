import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatelessWidget {
  // const Profile({Key key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        SizedBox(height: 15,),
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Color.fromRGBO(140, 88, 88, 100),
          ),
        ),
        SizedBox(height: 30,),
        Card(
          child: ListTile(
            leading: SvgPicture.asset('assets/user.svg'),
            title: Text('Name Surname'),
            trailing: SvgPicture.asset('assets/edit.svg'),
          ),
        ),
        Card(
          child: ListTile(
            leading: SvgPicture.asset('assets/message.svg'),
            title: Text(user.email!),
            trailing: SvgPicture.asset('assets/edit.svg'),
          ),
        ),

        Card(
          child: ListTile(
            leading: SvgPicture.asset('assets/world.svg'),
            title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text('Language'),
              Text('English')
            ]
            ),
            trailing: SvgPicture.asset('assets/arrow.svg'),

            // Row(
            //   children: [
            //     Expanded(child: Text('English')),
            //     Expanded(child: SvgPicture.asset('assets/arrow.svg')),
            //   ],
            // )
          ),
        ),

        Card(
          child: ListTile(
            leading: SvgPicture.asset('assets/colors.svg'),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Theme'),
                  Text('Default')
                ]
            ),
            trailing: SvgPicture.asset('assets/arrow.svg'),
            // Row(
            //   children: [
            //   Expanded(child: Text('Default')),
            //     Expanded(child:SvgPicture.asset('assets/arrow.svg')),
            //   ],
            // )
          ),
        ),

        Card(
          child: ListTile(
            leading: SvgPicture.asset('assets/fonts.svg'),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Font size'),
                  Text('Medium')
                ]
            ),
            trailing: SvgPicture.asset('assets/arrow.svg'),

    //         Row(
    //           children: [
    // Expanded(child:Text('Medium')),
    //           Expanded(child:SvgPicture.asset('assets/arrow.svg')),
    //           ],
    //         )
          ),
        ),

        Card(
          child: ListTile(
            leading: SvgPicture.asset('assets/question.svg'),
            title: Text('Support'),
          ),
        ),

        Card(
          child: ListTile(
            leading: SvgPicture.asset('assets/logout.svg'),
            title: ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text('Log out'),
            )
          ),
        )
      ],
    ));
  }
}
