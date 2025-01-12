import 'package:flutter/material.dart';
import 'package:travel_app/screens/bar_item_screen.dart';
import 'package:travel_app/screens/welcome_screen.dart';
import 'package:travel_app/screens/my_screen.dart';
import 'package:travel_app/screens/search_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  List pages = [
    HomeScreen(),
    BarItemScreen(),
    SearchScreen(),
    MyScreen()
  ];

  int currentIndex = 0;
  void onTap (int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
        BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.apps)),
        BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.bar_chart_sharp)),
        BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.search_sharp)),
        BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.person)),
      ]),
    );
  }
}
