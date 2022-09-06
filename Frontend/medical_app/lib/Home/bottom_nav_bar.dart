import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_main.dart';



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var primaryColor=const Color(0xff2196F3);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  int _selectedIndex = 2;
  List<Widget>MyPages=[
    Home(),
    Home(),
    Home(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'الحساب',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'المواعيد',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الحساب',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}