import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/constants/screen_size.dart';
import 'package:insta_clone/widgets/comment.dart';
import 'package:insta_clone/widgets/my_progress_indicator.dart';
import 'package:insta_clone/widgets/rounded_avatar.dart';

class Post extends StatelessWidget {
  final int index;

  Post(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _postHeader(),
          _postImage(),
          _postActions(),
          _postLikes(),
          _postCaption(),
        ],
      ),
    );
  }

  Padding _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: common_gap,
        vertical: common_xxs_gap,
      ),
      child: Comment(
          showAvatar: false, username: 'Hyun', text: 'I want more money.'),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '444 likes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: [
        IconButton(
          icon: ImageIcon(AssetImage('assets/images/bookmark.png')),
          onPressed: null,
          color: Colors.black87,
        ),
        IconButton(
          icon: ImageIcon(AssetImage('assets/images/comment.png')),
          onPressed: null,
          color: Colors.black87,
        ),
        IconButton(
          icon: ImageIcon(AssetImage('assets/images/direct_message.png')),
          onPressed: null,
          color: Colors.black87,
        ),
        Spacer(),
        IconButton(
          icon: ImageIcon(AssetImage('assets/images/heart.png')),
          onPressed: null,
          color: Colors.black87,
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: common_xxs_gap),
            child: RoundedAvatar(),
          ),
          Expanded(
              child: Text(
            'Stocker',
            style: TextStyle(
              fontSize: avatar_name_size,
            ),
          )),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
              size: avatar_img_size,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _postImage() {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/400/600',
      placeholder: (context, url) {
        return MyProgressIndicator(
          containerSize: screenSize.width,
        );
      },
      imageBuilder: (context, imageProvider) {
        return AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
