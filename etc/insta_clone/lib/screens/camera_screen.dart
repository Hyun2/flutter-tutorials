import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/take_photo.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  List<BottomNavigationBarItem> _btmNavItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add,
        size: 0,
      ),
      label: 'GALLERY',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add,
        size: 0,
      ),
      label: 'PHOTO',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add,
        size: 0,
      ),
      label: 'VIDEO',
    ),
  ];
  PageController _pageController = PageController(initialPage: 1);
  List<Widget> _pages = <Widget>[
    Container(
      color: Colors.blue[300],
    ),
    TakePhoto(),
    Container(
      color: Colors.orange[300],
    ),
  ];
  String _title = "Photo";

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
            switch (_currentIndex) {
              case 0:
                _title = "Gallery";
                break;
              case 1:
                _title = "Photo";
                break;
              case 2:
                _title = "Video";
                break;
            }
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _btmNavItems,
        selectedItemColor: Colors.black87,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedFontSize: 14,
        selectedFontSize: 16,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _pageController.animateToPage(
              _currentIndex,
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
            );
            switch (_currentIndex) {
              case 0:
                _title = "Gallery";
                break;
              case 1:
                _title = "Photo";
                break;
              case 2:
                _title = "Video";
                break;
            }
          });
        },
      ),
    );
  }
}
