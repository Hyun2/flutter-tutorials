import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BusinessPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: CachedNetworkImage(imageUrl: 'https://picsum.photos/900'),
    );
  }
}
