import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kakao_taxi/constants/common_size.dart';
import 'package:kakao_taxi/screens/service.dart';

class ChatPopup extends StatelessWidget {
  final User user;
  final int index;

  const ChatPopup({Key key, this.user, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅 상세'),
      ),
      body: Hero(
        tag: index,
        child: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/id/$index/1600/1600',
          fit: BoxFit.fill,
          height: screenSize.height,
        ),
      ),
    );
  }
}
