import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            ProfileBody(),
          ],
        ),
      ),
    );
  }

  Row _appBar() {
    return Row(
      children: [
        SizedBox(width: 44),
        Expanded(
          child: Text(
            'Account 정보',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {},
        )
      ],
    );
  }
}
