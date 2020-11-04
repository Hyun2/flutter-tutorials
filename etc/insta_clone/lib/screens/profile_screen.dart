import 'package:flutter/material.dart';
import 'package:insta_clone/constants/screen_size.dart';
import 'package:insta_clone/widgets/profile_body.dart';
import 'package:insta_clone/widgets/profile_side_menu.dart';

const Duration duration = Duration(milliseconds: 444);

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final menuWidth = screenSize.width / 3 * 2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double _profileXpos = 0;
  double _menuXpos = screenSize.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(_profileXpos, 0, 0),
            child: ProfileBody(onClickedMenu: () {
              setState(() {
                _menuStatus = (_menuStatus == MenuStatus.closed)
                    ? MenuStatus.opened
                    : MenuStatus.closed;
                switch (_menuStatus) {
                  case MenuStatus.closed:
                    _profileXpos = 0;
                    _menuXpos = screenSize.width;
                    break;
                  case MenuStatus.opened:
                    _profileXpos = -menuWidth;
                    _menuXpos = screenSize.width - menuWidth;
                    break;
                }
              });
            }),
          ),
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(_menuXpos, 0, 0),
            // width: screenSize.width / 2,
            child: Container(
              width: menuWidth,
              color: Colors.white,
              child: ProfileSideMenu(),
              // child: SafeArea(child: Text('하이')),
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus { opened, closed }
