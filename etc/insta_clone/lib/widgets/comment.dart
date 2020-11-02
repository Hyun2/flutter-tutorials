import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/rounded_avatar.dart';

class Comment extends StatelessWidget {
  final bool showAvatar;
  final String username;
  final String text;
  final DateTime dateTime;

  const Comment({
    Key key,
    this.showAvatar = true,
    @required this.username,
    @required this.text,
    this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showAvatar ? RoundedAvatar() : Container(),
        Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: username,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: text,
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            dateTime != null
                ? Text(
                    dateTime.toIso8601String(),
                    style: TextStyle(color: Colors.grey[400]),
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
