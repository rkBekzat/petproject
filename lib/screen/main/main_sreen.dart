import 'package:flutter/material.dart';
import 'package:petproject/screen/main/components/Adding.dart';
import 'package:petproject/screen/main/components/Home.dart';
import 'package:petproject/screen/main/components/Profile.dart';
import 'package:flutter_svg/svg.dart';


class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // const Main({Key key}) : super(key: key);

  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    Home(),
    Adding(),
    Profile(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg'),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/plusincircle.svg'),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/settings.svg'),
            label: ''
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
