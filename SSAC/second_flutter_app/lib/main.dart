import 'package:flutter/material.dart';
import 'package:second_flutter_app/couter.dart';
import 'package:second_flutter_app/first_list.dart';
import 'package:second_flutter_app/navigation/first_page.dart';
import 'package:second_flutter_app/ui/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Flutter 강의',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '1-1 환경설정',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[400],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    // private 헬퍼 메소드
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        '오늘은 환경설정을 하고 flutter layout tutorial을 따라해보는 실습을 하였습니다.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('생존코딩 FLUTTER'),
      //   ),
      //   body: ListView(
      //     children: [
      //       Image.asset(
      //         'images/flutter.png',
      //         width: 600,
      //         height: 240,
      //         fit: BoxFit.cover,
      //       ),
      //       titleSection,
      //       buttonSection,
      //       textSection,
      //     ],
      //   ),
      // ),
      // home: Counter(),
      // home: FirstList(),
      home: MainPage(),
    );
  }
}
