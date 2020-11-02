import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double containerSize;
  final double indicatorSize;

  const MyProgressIndicator({
    Key key,
    this.containerSize,
    this.indicatorSize = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: containerSize,
        height: containerSize,
        child: Center(
          child: SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: Image.asset('assets/images/loading_img.gif'),
            // child: CircularProgressIndicator(
            //   backgroundColor: Colors.black38,
            // ),
          ),
        ));
  }
}
