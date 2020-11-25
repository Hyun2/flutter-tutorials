import 'package:flutter/material.dart';
import 'package:todo/models/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TodoItem> list = [];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              print(value);
              setState(() {
                _controller.text = '';
              });
            },
            decoration: InputDecoration(prefixIcon: Icon(Icons.add)),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(list[index].title),
              ),
              itemCount: list.length,
            ),
          )
        ],
      )),
    );
  }
}
