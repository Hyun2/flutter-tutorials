import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  final int size;

  const RoundedAvatar({
    Key key,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(imageUrl: 'https://picsum.photos/$size'),
    );
  }
}
