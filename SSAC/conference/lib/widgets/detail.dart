import 'package:conference/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ConfDetail extends StatefulWidget {
  final confData;

  const ConfDetail({Key key, this.confData}) : super(key: key);

  @override
  _ConfDetailState createState() => _ConfDetailState();
}

class _ConfDetailState extends State<ConfDetail> {
  String start;
  String end;
  DateFormat dateFormatter = new DateFormat.yMMMMd('en_US');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      start = dateFormatter
          .format(DateTime.parse(widget.confData['start'].replaceAll('-', '')));
      end = dateFormatter
          .format(DateTime.parse(widget.confData['end'].replaceAll('-', '')));
    });
  }

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
              ListTitle(title: widget.confData['name']),
              innerText(widget.confData['location']),
              innerText("${start} ~ ${end}"),
              TextButton(
                onPressed: () {
                  _launchURL(widget.confData['link']);
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
}
