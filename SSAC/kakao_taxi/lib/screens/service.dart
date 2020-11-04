import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kakao_taxi/popup/chat.dart';

class Service extends StatelessWidget {
  List<User> _items = [
    User(age: 22, lastText: "안녕하세요.", name: 'Hyun'),
    User(age: 32, lastText: "반갑습니다.", name: 'Stocker'),
    User(age: 42, lastText: "좋은 하루 되세요.", name: 'Paul'),
    User(age: 52, lastText: "오늘 운이 좋은 것 같아요.", name: 'Kim'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('채팅')),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => _chatList(context, index),
          itemCount: _items.length,
        ),
      ),
    );
  }

  Padding _chatList(context, index) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ChatPopup(user: _items[index], index: index),
                transitionDuration: Duration(milliseconds: 300),
                reverseTransitionDuration: Duration(milliseconds: 300),
              ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: index,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipOval(
                  child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/id/$index/60/60'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_items[index].name}'),
                  Text('${_items[index].lastText}')
                ],
              ),
            ),
            Text('오후 8:24'),
          ],
        ),
      ),
    );
  }

  Padding _imageItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://picsum.photos/300',
            fit: BoxFit.cover,
          ),
          Row(children: [
            Text('${_items[index].name}, ${_items[index].age}',
                style: TextStyle(fontSize: 18))
          ]),
        ],
      ),
    );
  }

  Text _textItem(int index) =>
      Text('Name: ${_items[index].name}, Age: ${_items[index].age}');
}

class User {
  String name;
  int age;
  String lastText;

  User({
    this.name,
    this.age,
    this.lastText,
  });
}
