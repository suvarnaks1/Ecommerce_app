import 'package:ecomerce_app/Screens/HomePage.dart';
import 'package:ecomerce_app/Screens/detail.dart';
import 'package:ecomerce_app/models/ecomercemodel.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 7,
        backgroundColor: Colors.white,
        tabBackgroundColor: const Color.fromARGB(255, 246, 174, 198),
        activeColor: Colors.black,
        padding: EdgeInsets.all(10),
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.category, text: 'Category'),
          GButton(icon: Icons.person, text: "Account"),
          GButton(icon: Icons.settings, text: 'Settings'),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomePage(),
             // DetailPage(),
          Container(
            color: Colors.green,
            child: Center(
              child: Text('Category Content'),
            ),
          ),
       
          Container(
            color: Colors.blue,
            child: Center(
              child: Text('Account Content'),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Center(
              child: Text('Settings Content'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}


