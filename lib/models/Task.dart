import 'dart:convert';

class Task {
  final String id;
  final String title;
  final String description;
  bool isDone;

  Task({this.id, this.title, this.description, this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Task(
      id: map['id'],
      title: map['title'],
      description: map['body'],
      isDone: map['isDone']
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
