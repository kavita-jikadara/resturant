import 'package:flutter/material.dart';
class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: const Text(
        'Navigation Drawer',
      ),
      backgroundColor: const Color(0xff764abc),
    ),
   drawer: Drawer(
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: const Color(0xff764abc)),
        accountName: Text(
          "Pinkesh Darji",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        accountEmail: Text(
          "pinkesh.earth@gmail.com",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        currentAccountPicture: FlutterLogo(),
      ),
      ListTile(
        leading: Icon(
          Icons.home,
        ),
        title: const Text('Page 1'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(
          Icons.train,
        ),
        title: const Text('Page 2'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      AboutListTile( // <-- SEE HERE
        icon: Icon(
          Icons.info,
        ),
        child: Text('About app'),
        applicationIcon: Icon(
          Icons.local_play,
        ),
        applicationName: 'My Cool App',
        applicationVersion: '1.0.25',
        applicationLegalese: '© 2019 Company',
        aboutBoxChildren: [
          ///Content goes here...
        ],
      ),
    ],
  ),
    ),
    );

  }
}