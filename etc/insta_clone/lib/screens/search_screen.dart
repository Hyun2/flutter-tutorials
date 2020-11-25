import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/rounded_avatar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<bool> list = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              setState(() {
                list[index] = !list[index];
              });
            },
            leading: RoundedAvatar(),
            title: Text('username $index'),
            subtitle: Text('user bio information $index'),
            trailing: Container(
              width: 80,
              height: 30,
              child: Text(
                'Following',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: list[index] ? Colors.red[50] : Colors.blue[50],
                color: Colors.blue[50],
                border: Border.all(
                    // color: list[index] ? Colors.red : Colors.blue, width: 0.5),
                    color: Colors.blue,
                    width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
