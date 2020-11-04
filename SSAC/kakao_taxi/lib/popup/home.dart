import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePopup extends StatelessWidget {
  final int index;

  const HomePopup({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Page'),
      ),
      backgroundColor: Colors.white,
      body: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/id/$index/1200/1200',
          fit: BoxFit.cover),
    );
  }
}
