import 'package:admin_panel/pendingorderscreen.dart';
import 'package:admin_panel/productlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/addproductscreen.dart';
import 'package:admin_panel/resprofile.dart';

class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  int _selectedTab = 0;

  final List<Widget> _pages = [
    order(),
    plist(),
    // pending(),
    profile(),
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('App Title'), // Set a static title or make it dynamic based on the selected tab without using _titles
      //   elevation: 0,
      // ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _changeTab,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,size: 30,), label: "Pending Order"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_rounded), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
