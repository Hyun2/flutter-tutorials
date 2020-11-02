import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kakao_taxi/constants/common_size.dart';
import 'package:kakao_taxi/widgets/progress_indicator.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    _title(),
                    _subTitle(),
                    _emailField(),
                    _image(),
                  ]),
                )
              ],
            )),
      ),
    );
    ;
  }

  Expanded _image() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            placeholder: (context, url) {
              return MyProgressIndicator(containerSize: screenSize.width);
            },
            fit: BoxFit.cover,
            imageUrl: 'https://picsum.photos/400',
          ),
        ),
      ),
    );
  }

  TextField _emailField() {
    return TextField(
      // obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          labelText: 'bussiness@SSAC.co.kr',
          labelStyle: TextStyle(color: Colors.grey[600])),
    );
  }

  Padding _subTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text('''업무용 이메일만 등록하면,\nSSAC T가 정리해서 보내드릴게요.''',
          style: TextStyle(
              fontSize: 22,
              color: Colors.grey[600],
              fontWeight: FontWeight.normal)),
    );
  }

  Padding _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0),
      child: Text('''Hyun님,\n이번달 야근택시 영수증\n챙기셨어요?''',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}
