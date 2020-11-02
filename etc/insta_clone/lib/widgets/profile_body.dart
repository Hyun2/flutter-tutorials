import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/constants/screen_size.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    Key key,
  }) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

enum SelectedTab { left, right }

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPage = 0;
  double _rightImagesPage = -screenSize.width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            _userName(),
            _userBio(),
            _editProfileBtn(),
            _tabBtns(),
            _tabAnimation(),
          ])),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: Matrix4.translationValues(_leftImagesPage, 0, 0),
                  curve: Curves.fastOutSlowIn,
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: _gridViewImages(),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: Matrix4.translationValues(_rightImagesPage, 0, 0),
                  curve: Curves.fastOutSlowIn,
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: _gridViewImages(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _gridViewImages() {
    return List.generate(
        30,
        (index) => CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: 'https://picsum.photos/id/${index}/150/150',
            ));
  }

  Padding _tabAnimation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        alignment: _selectedTab == SelectedTab.left
            ? Alignment.centerLeft
            : Alignment.centerRight,
        curve: Curves.easeInOut,
        child: Container(
          height: 3,
          width: (screenSize.width - common_gap * 2) / 2,
          color: Colors.black87,
        ),
      ),
    );
  }

  Row _tabBtns() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            icon: ImageIcon(AssetImage('assets/images/grid.png')),
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.left;
                _leftImagesPage = 0;
                _rightImagesPage = -screenSize.width;
              });
            },
            color: _selectedTab == SelectedTab.left
                ? Colors.black
                : Colors.black12,
          ),
        ),
        Expanded(
          child: IconButton(
            icon: ImageIcon(AssetImage('assets/images/saved.png')),
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.right;
                _leftImagesPage = screenSize.width;
                _rightImagesPage = 0;
              });
            },
            color: _selectedTab == SelectedTab.right
                ? Colors.black
                : Colors.black12,
          ),
        )
      ],
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 30,
        child: OutlineButton(
          onPressed: () {},
          child: Text('Edit Profile'),
          borderSide: BorderSide(color: Colors.black87),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text('User Bio Info'),
    );
  }

  Padding _userName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text('User Name'),
    );
  }
}
