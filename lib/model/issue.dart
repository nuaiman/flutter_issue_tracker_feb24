import 'package:flutter/foundation.dart';

class Issue {
  int id;
  int number;
  String title;
  User user;
  List<Label> labels;
  DateTime createdAt;
  String body;

  Issue({
    required this.id,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.createdAt,
    required this.body,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      id: json['id'],
      number: json['number'],
      title: json['title'],
      user: User.fromJson(json['user']),
      labels: (json['labels'] as List<dynamic>)
          .map((labelJson) => Label.fromJson(labelJson))
          .toList(),
      createdAt: DateTime.parse(json['created_at']),
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'title': title,
      'user': user.toJson(),
      'labels': labels.map((label) => label.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'body': body,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'title': title,
      'user': user.toMap(),
      'labels': labels.map((label) => label.toMap()).toList(),
      'created_at': createdAt.toIso8601String(),
      'body': body,
    };
  }

  Issue copyWith({
    int? id,
    int? number,
    String? title,
    User? user,
    List<Label>? labels,
    DateTime? createdAt,
    String? body,
  }) {
    return Issue(
      id: id ?? this.id,
      number: number ?? this.number,
      title: title ?? this.title,
      user: user ?? this.user,
      labels: labels ?? this.labels,
      createdAt: createdAt ?? this.createdAt,
      body: body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'Issue(id: $id, number: $number, title: $title, user: $user, labels: $labels, createdAt: $createdAt, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Issue &&
        other.id == id &&
        other.number == number &&
        other.title == title &&
        other.user == user &&
        listEquals(other.labels, labels) &&
        other.createdAt == createdAt &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        number.hashCode ^
        title.hashCode ^
        user.hashCode ^
        labels.hashCode ^
        createdAt.hashCode ^
        body.hashCode;
  }
}

class Label {
  int id;
  String name;
  String color;

  Label({
    required this.id,
    required this.name,
    required this.color,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      id: json['id'],
      name: json['name'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  @override
  String toString() => 'Label(id: $id, name: $name, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Label &&
        other.id == id &&
        other.name == name &&
        other.color == color;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;

  Label copyWith({
    int? id,
    String? name,
    String? color,
  }) {
    return Label(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}

class User {
  String login;

  User({
    required this.login,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.login == login;
  }

  @override
  int get hashCode => login.hashCode;

  @override
  String toString() => 'User(login: $login)';

  User copyWith({
    String? login,
  }) {
    return User(
      login: login ?? this.login,
    );
  }
}
