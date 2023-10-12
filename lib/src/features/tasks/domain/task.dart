// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  String id;
  String name;
  bool state;

  Task({
    required this.id,
    required this.name,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'state': state,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      name: map['name'] as String,
      state: map['state'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
