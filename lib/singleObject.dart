import 'package:flutter/material.dart';
import 'package:flutter_task/model.dart';

class SingleObject extends StatelessWidget {
  final GithubRepoModel githubRepoModel;
  const SingleObject({Key? key, required this.githubRepoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(githubRepoModel.name),
    );
  }
}
