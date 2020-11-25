import 'dart:convert';

class TodoItem {
  final DateTime id;
  final String title;
  final bool done;
  TodoItem({
    this.id,
    this.title,
    this.done,
  });

  TodoItem copyWith({
    DateTime id,
    String title,
    bool done,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id?.millisecondsSinceEpoch,
      'title': title,
      'done': done,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TodoItem(
      id: DateTime.fromMillisecondsSinceEpoch(map['id']),
      title: map['title'],
      done: map['done'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItem.fromJson(String source) =>
      TodoItem.fromMap(json.decode(source));

  @override
  String toString() => 'TodoItem(id: $id, title: $title, done: $done)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TodoItem && o.id == id && o.title == title && o.done == done;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ done.hashCode;
}
