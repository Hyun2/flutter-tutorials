## 디바이스 사이즈

```dart
if (screenSize == null) screenSize = MediaQuery.of(context).size;
```



## Scaffold > bottomNavigationBar

<img src="https://imgur.com/MolIQLg.jpg" width="400px" />

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

<img src="https://imgur.com/rGFzJwf.gif" style="width:400px" />

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

<img src="https://imgur.com/7RBP24k.jpg" style="width:400px" />

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

<img src="https://imgur.com/IedP854.jpg" style="width:400px" />



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

<img src="https://imgur.com/Tr8M7e5.jpg" style="width:400px" />



## Spacer

<img src="https://imgur.com/pBFNsat.jpg" style="width: 400px" />

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

<img src="https://imgur.com/M7lgLDC.jpg" style="width: 400px" />



## RichText, TextSpan

<img src="https://imgur.com/NVvlSe8.jpg" style="width: 400px" />

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

