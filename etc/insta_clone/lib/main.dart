import 'package:flutter/material.dart';
import 'package:insta_clone/constants/material_white.dart';
import 'package:insta_clone/constants/screen_size.dart';
import 'package:insta_clone/screens/auth_screen.dart';
import 'package:insta_clone/screens/camera_screen.dart';
import 'package:insta_clone/screens/feed_screen.dart';
import 'package:insta_clone/screens/profile_screen.dart';
import 'package:permission_handler/permission_handler.dart';

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
      // home: HomePage(),
      home: AuthScreen(),
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
      icon: Icon(Icons.camera_alt),
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

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (screenSize == null) screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
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
          switch (index) {
            case 2:
              _openCamera(context);
              break;
            default:
              {
                setState(() {
                  _selectedIndex = index;
                });
              }
          }
        },
      ),
    );
  }

  Future _openCamera(BuildContext context) async {
    if (await _cameraPhonePermissionGranted(context)) {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CameraScreen(),
      ));
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('사진, 파일, 마이크 사용을 허용하셔야 카메라를 사용할 수 있습니다.'),
        action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
            }),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  Future<bool> _cameraPhonePermissionGranted(BuildContext context) async {
    bool permitted = true;
    Map<Permission, PermissionStatus> statuses =
        await [Permission.camera, Permission.microphone].request();

    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) {
        permitted = false;
      }
    });

    return permitted;
  }
}
