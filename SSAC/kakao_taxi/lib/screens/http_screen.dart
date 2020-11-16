import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpScreen extends StatefulWidget {
  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
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
          title: Text(users[index]['name']),
          onTap: () {},
        ),
        itemCount: users.length,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                users = [];
              });
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 30,
          ),
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
