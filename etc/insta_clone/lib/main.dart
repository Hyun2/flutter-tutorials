import 'package:flutter/material.dart';
import 'package:insta_clone/constants/material_white.dart';
import 'package:insta_clone/constants/screen_size.dart';
import 'package:insta_clone/screens/auth_screen.dart';
import 'package:insta_clone/screens/feed_screen.dart';
import 'package:insta_clone/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: HomePage(),
      // home: AuthScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'School',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Add',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Account',
    ),
  ];

  List<Widget> _screens = [
    FeedScreen(),
    Container(color: Colors.blueAccent),
    Container(color: Colors.cyanAccent),
    Container(color: Colors.deepOrangeAccent),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (screenSize == null) screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: btmNavItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
