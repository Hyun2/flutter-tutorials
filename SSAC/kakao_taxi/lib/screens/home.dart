import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kakao_taxi/constants/common_size.dart';
import 'package:kakao_taxi/popup/home.dart';
import 'package:kakao_taxi/widgets/progress_indicator.dart';

class Home extends StatelessWidget {
  List<Widget> homeBodyMenuItems = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_taxi, size: 50, color: Colors.amberAccent),
        SizedBox(height: 10),
        Text('택시', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_airport, size: 50, color: Colors.blueAccent),
        SizedBox(height: 10),
        Text('비행기', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_atm, size: 50, color: Colors.cyanAccent),
        SizedBox(height: 10),
        Text('ATM', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_bar, size: 50, color: Colors.deepOrangeAccent),
        SizedBox(height: 10),
        Text('주점', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_cafe, size: 50, color: Colors.deepPurpleAccent),
        SizedBox(height: 10),
        Text('카페', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_car_wash, size: 50, color: Colors.greenAccent),
        SizedBox(height: 10),
        Text('세차', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_convenience_store,
            size: 50, color: Colors.indigoAccent),
        SizedBox(height: 10),
        Text('편의점', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_dining, size: 50, color: Colors.lightBlueAccent),
        SizedBox(height: 10),
        Text('식사', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_florist, size: 50, color: Colors.lightGreenAccent),
        SizedBox(height: 10),
        Text('화원', style: TextStyle(color: Colors.black87)),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_gas_station, size: 50, color: Colors.pinkAccent),
        SizedBox(height: 10),
        Text('주유소', style: TextStyle(color: Colors.black87)),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SSAC T',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                _profilieImage(),
                _title(),
                _menu(),
                _carousel(),
                Text('''Notification\n\n\n\n\하이''')
              ]))
            ],
          )),
    );
  }

  CarouselSlider _carousel() {
    return CarouselSlider(
      options: CarouselOptions(height: 160.0),
      items: [0, 2, 4, 8, 10].map((index) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: screenSize.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePopup(index: index)));
                    },
                    child: CachedNetworkImage(
                      placeholder: (context, url) {
                        return MyProgressIndicator(
                          containerSize: screenSize.width - 10,
                          indicatorSize: 80,
                        );
                      },
                      fit: BoxFit.cover,
                      imageUrl: 'https://picsum.photos/id/$index/400/600',
                    ),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  GridView _menu() {
    return GridView.count(
      crossAxisCount: 4,
      children: homeBodyMenuItems,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      shrinkWrap: true,
    );
  }

  Column _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            '''안녕하세요.\nSSAC T 입니다.''',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Padding _profilieImage() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 18.0,
      ),
      child: Container(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 60,
            color: Colors.grey[400],
          ),
          onPressed: null,
        ),
      ),
    );
  }
}
