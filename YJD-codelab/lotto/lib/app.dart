import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Lotter Number Generator'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key) {
    for (var i = 1; i <= 45; i++) {
      numbers.add(i);
    }
    numbers.shuffle();
  }

  var numbers = [];
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  '${widget.numbers[index]}',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              widget.numbers.shuffle();
            });
          },
          tooltip: 'Shuffle',
          child: Icon(Icons
              .shuffle)), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
