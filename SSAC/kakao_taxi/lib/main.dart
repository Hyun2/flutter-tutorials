import 'package:flutter/material.dart';
import 'package:kakao_taxi/constants/common_size.dart';
import 'package:kakao_taxi/constants/material_white.dart';
import 'package:kakao_taxi/screens/animation_page.dart';
import 'package:kakao_taxi/screens/business.dart';
import 'package:kakao_taxi/screens/home.dart';
import 'package:kakao_taxi/screens/http_screen.dart';
import 'package:kakao_taxi/screens/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KAKAO T CLONE',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: HomePage(),
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
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
    BottomNavigationBarItem(icon: Icon(Icons.badge), label: '비즈니스'),
    BottomNavigationBarItem(icon: Icon(Icons.notes_rounded), label: '이용서비스'),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_box_rounded), label: '내 정보'),
    BottomNavigationBarItem(icon: Icon(Icons.network_check), label: 'http'),
  ];

  List<Widget> _screens = [
    Home(),
    Business(),
    Service(),
    AnimationPage(),
    HttpScreen()
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
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: btmNavItems,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
