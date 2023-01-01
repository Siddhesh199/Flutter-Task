import 'dart:convert';

class GithubRepoModel {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;

  GithubRepoModel(
      {required this.id, required this.nodeId, required this.name, required this.fullName, required this.private});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nodeId': nodeId,
      'name': name,
      'fullName': fullName,
      'private': private,
    };
  }

  factory GithubRepoModel.fromMap(Map<String, dynamic> map) {
    return GithubRepoModel(
      id: map['id'] ?? '',
      nodeId: map['nodeId'] ?? '',
      name: map['name'] ?? '',
      fullName: map['fullName'] ?? '',
      private: map['private'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubRepoModel.fromJson(String source) => GithubRepoModel.fromMap(json.decode(source));
}