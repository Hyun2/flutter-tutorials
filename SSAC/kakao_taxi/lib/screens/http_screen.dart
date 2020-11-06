import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpScreen extends StatefulWidget {
  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  // Future<Album> futureAlbum;
  List users = [];

  void getUsers() async {
    String url = 'https://jsonplaceholder.typicode.com/users';
    http.Response res = await http.get(url);
    List data = jsonDecode(res.body);
    setState(() {
      users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
          title: users.length > 0 ? Text(users[index]['name']) : Text(''),
          onTap: () {},
        ),
        itemCount: users.length,
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                users = [];
              });
            },
            child: Icon(Icons.remove),
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: () {
              getUsers();
            },
            child: Icon(Icons.call_received),
          ),
        ],
      ),
    );
  }
}
