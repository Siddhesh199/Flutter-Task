import 'dart:convert';

import 'package:flutter/material.dart';

class CommitModel {
  final Commit commit;

  CommitModel({required this.commit});

  Map<String, dynamic> toMap() {
    return {
      'commit': commit
    };
  }

  factory CommitModel.fromMap(Map<String, dynamic> map) {
    return CommitModel(
      commit: map['commit'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommitModel.fromJson(String source) => CommitModel.fromMap(json.decode(source));
}

class Commit {
  final String message;

  Commit({required this.message});

  Map<String, dynamic> toMap() {
    return {
      'message': message
    };
  }

  factory Commit.fromMap(Map<String, dynamic> map) {
    return Commit(
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Commit.fromJson(String source) => Commit.fromMap(json.decode(source));
}