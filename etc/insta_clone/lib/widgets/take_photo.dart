import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/constants/screen_size.dart';
import 'package:insta_clone/models/camera_state.dart';
import 'package:insta_clone/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';

class TakePhoto extends StatefulWidget {
  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CameraState>(
      builder: (BuildContext context, CameraState cameraState, Widget child) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.width,
              color: Colors.black,
              child: cameraState.isReadyToTakePhoto
                  ? _getPreview(cameraState)
                  : MyProgressIndicator(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(common_gap * 3),
                child: OutlinedButton(
                  onPressed: () {},
                  child: null,
                  style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    side: BorderSide(width: 20, color: Colors.black12),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _getPreview(CameraState cameraState) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
              width: screenSize.width,
              height:
                  screenSize.width / cameraState.controller.value.aspectRatio,
              child: CameraPreview(cameraState.controller)),
        ),
      ),
    );
  }
}
