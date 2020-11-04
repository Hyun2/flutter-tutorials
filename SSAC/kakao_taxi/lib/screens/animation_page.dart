import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double _width = 100;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange[400]),
                  onPressed: () {
                    setState(() {
                      _width = 300;
                      _height = 300;
                    });
                  },
                  child: Text(
                    '늘리기',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.lightBlue[200]),
                  onPressed: () {
                    setState(() {
                      _width = 100;
                      _height = 100;
                    });
                  },
                  child: Text(
                    '줄이기',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              curve: Curves.easeInOut,
              width: _width,
              height: _height,
              color: Colors.green[400],
              duration: Duration(milliseconds: 400),
            )
          ],
        ),
      ),
    );
  }
}
