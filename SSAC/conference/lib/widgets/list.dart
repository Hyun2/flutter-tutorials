import 'dart:convert';

import 'package:conference/widgets/detail.dart';
import 'package:conference/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConfList extends StatefulWidget {
  @override
  _ConfListState createState() => _ConfListState();
}

class _ConfListState extends State<ConfList> {
  List _confList = [];
  bool loaded = false;

  void load() async {
    setState(() {
      _confList = [];
    });

    String apiURL =
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json';
    var res = await http.get(apiURL);
    var data = jsonDecode(res.body);

    setState(() {
      _confList = data;
      loaded = true;
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTitle(title: 'Conferences'),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: _listItem(index),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ConfDetail(
                          confData: _confList[index],
                        ),
                      ));
                    },
                  ),
                  itemCount: _confList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _listItem(int index) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(_confList[index]['name']),
            Text(_confList[index]['location']),
          ],
        ),
      );
}
