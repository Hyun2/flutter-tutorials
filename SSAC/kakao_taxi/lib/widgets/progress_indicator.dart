import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double containerSize;
  final double indicatorSize;

  const MyProgressIndicator(
      {Key key, this.containerSize, this.indicatorSize = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      width: containerSize,
      child: Center(
        child: SizedBox(
          height: indicatorSize,
          width: indicatorSize,
          child: Image.asset('assets/images/progress_indicator.gif'),
        ),
      ),
    );
  }
}
