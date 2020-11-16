import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/constants/screen_size.dart';
import 'package:insta_clone/models/camera_state.dart';
import 'package:insta_clone/screens/share_post_screen.dart';
import 'package:insta_clone/widgets/my_progress_indicator.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
                  onPressed: () {
                    _attemptTakePhoto(cameraState, context);
                  },
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

  void _attemptTakePhoto(CameraState cameraState, BuildContext context) async {
    final String timeInMilli = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      final String path =
          join((await getTemporaryDirectory()).path, '$timeInMilli.png');
      await cameraState.controller.takePicture(path);

      File imageFile = File(path);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SharePostScreen(imageFile),
      ));
    } catch (e) {}
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
