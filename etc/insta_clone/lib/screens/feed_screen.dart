import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/post.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Instagram',
            style: TextStyle(
                fontFamily: 'VeganStyle', fontSize: 26, letterSpacing: 4)),
        leading: Icon(CupertinoIcons.camera),
        trailing: IconButton(
          icon: ImageIcon(
            AssetImage('assets/images/actionbar_camera.png'),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
      ),
      body: ListView.builder(itemBuilder: feedListBuilder, itemCount: 30),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Post(index);
  }
}
