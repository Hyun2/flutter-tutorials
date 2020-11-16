import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/constants/screen_size.dart';
import 'package:insta_clone/screens/profile_screen.dart';
import 'package:insta_clone/widgets/rounded_avatar.dart';

class ProfileBody extends StatefulWidget {
  final Function onClickedMenu;

  const ProfileBody({
    Key key,
    this.onClickedMenu,
  }) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

enum SelectedTab { left, right }

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPage = 0;
  double _rightImagesPage = -screenSize.width;
  AnimationController _menuAnimationController;

  @override
  void initState() {
    _menuAnimationController =
        AnimationController(vsync: this, duration: duration);
    super.initState();
  }

  @override
  void dispose() {
    _menuAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(widget.onClickedMenu),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    _profileHeader(),
                    _userName(),
                    _userBio(),
                    _editProfileBtn(),
                    _tabBtns(),
                    _tabAnimation(),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: _profileTabPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack _profileTabPage() {
    return Stack(
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
            children: _gridViewImages2(),
          ),
        ),
      ],
    );
  }

  Padding _profileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: common_xxs_gap, horizontal: common_gap),
      child: Row(
        children: [
          RoundedAvatar(size: 80),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    _valueText('123'),
                    _valueText('444'),
                    _valueText('432'),
                  ]),
                  TableRow(children: [
                    _labelText('posts'),
                    _labelText('followers'),
                    _labelText('followings'),
                  ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _appBar(onClickedMenu) {
    return Row(
      children: [
        SizedBox(width: 44),
        Expanded(
          child: Text(
            'Account 정보',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _menuAnimationController,
          ),
          onPressed: () {
            onClickedMenu();
            _menuAnimationController.isCompleted
                ? _menuAnimationController.reverse()
                : _menuAnimationController.forward();
          },
        ),
      ],
    );
  }

  Text _labelText(String label) => Text(label, textAlign: TextAlign.center);

  Text _valueText(value) {
    return Text(value,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
  }

  List<Widget> _gridViewImages() {
    return List.generate(
      30,
      (index) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: 'https://picsum.photos/id/${index}/150/150',
      ),
    );
  }

  List<Widget> _gridViewImages2() {
    List res = List.generate(30, (index) => index);
    res.sort((a, b) => b.compareTo(a));
    print(res);

    return res
        .map((index) => CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: 'https://picsum.photos/id/${index}/150/150',
            ))
        .toList();

    // return List.generate(
    //   30,
    //   (index) => CachedNetworkImage(
    //     fit: BoxFit.cover,
    //     imageUrl: 'https://picsum.photos/id/${index}/150/150',
    //   ),
    // );
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
              _tabSelected(SelectedTab.left);
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
              _tabSelected(SelectedTab.right);
            },
            color: _selectedTab == SelectedTab.right
                ? Colors.black
                : Colors.black12,
          ),
        )
      ],
    );
  }

  _tabSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          _selectedTab = SelectedTab.left;
          _leftImagesPage = 0;
          _rightImagesPage = -screenSize.width;

          break;
        case SelectedTab.right:
          _selectedTab = SelectedTab.right;
          _leftImagesPage = screenSize.width;
          _rightImagesPage = 0;
          break;
      }
    });
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
      child: Text('I want more money.'),
    );
  }

  Padding _userName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text('Tozau'),
    );
  }
}
