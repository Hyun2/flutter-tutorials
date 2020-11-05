## 디바이스 사이즈

```dart
if (screenSize == null) screenSize = MediaQuery.of(context).size;
```



## ListView

<p align="center"><img src="https://imgur.com/U7QDPln.gif" width="380" /></p>

- ListView: 스크롤이 가능한 위젯들을 리스트로 가지는 위젯



## Scaffold > bottomNavigationBar

<p align="center"><img src="https://imgur.com/MolIQLg.jpg" width="380" /></p>

```dart
int _selectedIndex = 0;

List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: 'Add',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Account',
    ),
];

Scaffold(
	...
    bottomNavigationBar: BottomNavigationBar(
        items: btmNavItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
            setState(() {
                _selectedIndex = index;
            });
        },
    ),
);
```



## IndexedStack

<p align="center"><img src="https://imgur.com/rGFzJwf.gif" width="380" /></p>

```dart
int _selectedIndex = 0;

List<Widget> _screens = [
    FeedScreen(),
    Container(color: Colors.blueAccent),
    Container(color: Colors.cyanAccent),
    Container(color: Colors.deepOrangeAccent),
    ProfileScreen(),
];

Scaffold(
	body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
    )
);
```

- IndexedStack: 앱 안에서 위젯 간에 간편한 이동을 위해서 사용, 한 번에 하위 항목 하나만을 보여주지만, **모든 하위 항목의 상태를 유지**
  - Navigator.push()를 통해서 위젯 간 이동을 수행한다면 이전 항목의 상태를 유지하지 못한다?



## Icon vs. IconButton

<p align="center"><img src="https://imgur.com/7RBP24k.jpg" width="380" /></p>


```dart
Scaffold(
    appBar: CupertinoNavigationBar(
        middle: Text(
            'Instagram',
            style: TextStyle(
                fontFamily: 'VeganStyle',
                fontSize: 20,
                letterSpacing: 4,
            ),
        ),
        leading: Icon(CupertinoIcons.camera),
        trailing: IconButton(
            icon: ImageIcon(
                AssetImage('assets/images/actionbar_camera.png'),
                color: Colors.black87,
            ),
            onPressed: null,
        ),
    )
)
```



## Expanded, ClipOval

<p align="center"><img src="https://imgur.com/IedP854.jpg" width="380" /></p>



```dart
Row(
    children: [
        Padding(
            padding: const EdgeInsets.only(right: common_xxs_gap),
            child: RoundedAvatar(),
        ),
        Expanded(
            child: Text(
                'Stocker',
                style: TextStyle(
                    fontSize: avatar_name_size,
                ),
            )),
        IconButton(
            icon: Icon(
                Icons.more_horiz,
                color: Colors.black87,
                size: avatar_img_size,
            ),
            onPressed: () {},
        )
    ],
);
    
ClipOval(
    child: CachedNetworkImage(imageUrl: 'https://picsum.photos/$size'),
);
```

- ClipOval: Image radius 50% 설정
- Expanded: Row나 Column 내에서 감싼 위젯의 영역을 확장시켜 빈 공간을 제거하는 위젯

##### Text를 Expanded로 감싸지 않았을 때는 아래와 같습니다.

<p align="center"><img src="https://imgur.com/Tr8M7e5.jpg" width="380" /></p>



## Spacer

<p align="center"><img src="https://imgur.com/pBFNsat.jpg" width="380" /></p>

```dart
Row(
    children: [
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/bookmark.png')),
            onPressed: null,
            color: Colors.black87,
        ),
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/comment.png')),
            onPressed: null,
            color: Colors.black87,
        ),
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/direct_message.png')),
            onPressed: null,
            color: Colors.black87,
        ),
        Spacer(),
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/heart.png')),
            onPressed: null,
            color: Colors.black87,
        ),
    ],
);
```

- Spacer: Row나 Column의 children으로 들어가 있는 위젯 사이에 빈 공간을 넣는 위젯

##### Spacer가 없을 때는 아래와 같습니다.

<p align="center"><img src="https://imgur.com/M7lgLDC.jpg" width="380" /></p>



## RichText, TextSpan

<p align="center"><img src="https://imgur.com/NVvlSe8.jpg" width="380" /></p>

- RichText, TextSpan: rich text에서 텍스트 별로 별도의 스타일을 적용하기 위한 위젯

```dart
RichText(
    text: TextSpan(
        children: [
            TextSpan(
                text: username,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                ),
            ),
            TextSpan(text: '  '),
            TextSpan(
                text: text,
                style: TextStyle(color: Colors.black87),
            ),
        ],
    ),
)
```



## Stack

<p align="center"><img src="https://imgur.com/SrSjrp6.jpg" width="380" /></p>

- Stack: 열과 행 또는 컨테이너 기반의 레이아웃 외에 중복이 가능한 레이아웃 구성을 가능케 하는 위젯
- 파란색 영역은 스크롤이 가능(디바이스 크기에 따라 모든 컨텐츠가 표현되지 않을 때)하고, 빨간색 영역은 고정되어 있다.
- FlatButton(구식) 대신 TextButton을 사용하자.



##  (정리 중)Image.asset vs. ImageIcon > AssetImage

```dart
TextButton.icon(
    style: TextButton.styleFrom(primary: Colors.blue[900]),
    onPressed: () {},
    // icon: Image.asset('assets/images/facebook.png'),
    icon: ImageIcon(
        AssetImage('assets/images/facebook.png'),
    ),
    label: Text(
        'Login with Facebook',
    ),
),
```

