import 'package:flutter/material.dart';
import 'package:second_flutter_app/ui/ThirdPage.dart';
import 'package:second_flutter_app/ui/first_page.dart';
import 'package:second_flutter_app/ui/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _seletedIndex = 0;

  List<Widget> _pages = [FirstPage(), SecondPage(), ThirdPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_seletedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: '이용서비스',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: '내 정보',
            ),
          ],
          currentIndex: _seletedIndex,
          onTap: (index) => {
            setState(() {
              _seletedIndex = index;
            })
          },
        ));
  }
}
