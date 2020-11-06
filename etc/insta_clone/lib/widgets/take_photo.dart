import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/constants/screen_size.dart';

class TakePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.black,
          width: screenSize.width,
          height: screenSize.width,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(common_gap * 3),
            child: OutlinedButton(
              onPressed: () {},
              child: null,
              style: OutlinedButton.styleFrom(
                shape: CircleBorder(),
                side: BorderSide(width: 20, color: Colors.black12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
