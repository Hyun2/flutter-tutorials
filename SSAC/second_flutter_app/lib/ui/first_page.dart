import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [_menuSection(), _adSection(), _noticeSection()],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Column(
      children: [Icon(icon, size: 80), Text(title)],
    );
  }

  Widget _menuSection() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _menuItem(Icons.local_taxi, '택시'),
              _menuItem(Icons.local_taxi, '택시'),
              _menuItem(Icons.local_taxi, '택시'),
              _menuItem(Icons.local_taxi, '택시'),
            ],
          ),
          Container(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _menuItem(Icons.local_taxi, '택시'),
              _menuItem(Icons.local_taxi, '택시'),
              _menuItem(Icons.local_taxi, '택시'),
              Opacity(child: _menuItem(Icons.local_taxi, '택시'), opacity: 0.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _adSection() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true,

        // autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _noticeSection() {
    // return Column(
    //   children: const <Widget>[
    //     Card(
    //       child: ListTile(
    //           leading: Icon(Icons.notification_important_outlined),
    //           title: Text('[이벤트 1] 오늘 택시 무료')),
    //     ),
    //     Card(
    //       child: ListTile(
    //           leading: Icon(Icons.notification_important_outlined),
    //           title: Text('[이벤트 2] 오늘 택시 무료')),
    //     ),
    //     Card(
    //       child: ListTile(
    //           leading: Icon(Icons.notification_important_outlined),
    //           title: Text('[이벤트 3] 오늘 택시 무료')),
    //     )
    //   ],
    // );
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true,
        scrollDirection: Axis.vertical,
        // autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
