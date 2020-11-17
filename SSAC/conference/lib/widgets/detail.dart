import 'package:conference/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ConfDetail extends StatelessWidget {
  final confData;

  const ConfDetail({Key key, this.confData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Conference",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTitle(title: confData['name']),
              innerText(confData['location']),
              innerText(
                  "${convertDate(confData['start'])} ~ ${convertDate(confData['end'])}"),
              // innerText("${start} ~ ${end}"),
              TextButton(
                onPressed: () {
                  _launchURL(confData['link']);
                },
                child: Text("Go to official website"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding innerText(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(text),
      );

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  String convertDate(String dateTime) {
    DateFormat dateFormatter = new DateFormat('MMM dd, yyyy');
    String res =
        dateFormatter.format(DateTime.parse(dateTime.replaceAll('-', '')));

    return res;
  }
}
