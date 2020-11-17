<p align="center"><img src="https://i.imgur.com/tDwAbjG.gif" width="380"></p>



## LIST 데이터 로드

```dart
void load() async {
    setState(() {
        _confList = [];
    });

    String apiURL =
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json';
    var res = await http.get(apiURL);
    var data = jsonDecode(res.body);

    setState(() {
        _confList = data;
        loaded = true;
    });
}

@override
void initState() {
    load();
    super.initState();
}
```



## 동적 ListView 필터

```dart
ListView.builder(
  itemBuilder: (context, index) {
    if (_searchController.text.isEmpty) {
      return _filteredItem(index, context);
    } else if (_confList[index]['name']
            .toLowerCase()
            .contains(_searchController.text) ||
        _confList[index]['location']
            .toLowerCase()
            .contains(_searchController.text)) {
      return _filteredItem(index, context);
    } else {
      return Container();
    }
  },
  itemCount: _confList.length,
)
```



## 앱에서 http 링크 연결

- `url_launcher` 패키지 사용

```dart
void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

onPressed: () {
	_launchURL(confData['link']);
}
```

- forceWebView: 기본적으로 안드로이드는 url 핸들링을 위해서 브라우저를 연다. 이것을 앱 내에서 핸들링하기 위해서 해당 파라미터 값으로 true 전달