import 'package:flutter/material.dart';
import 'package:flutter_task/commit_model.dart';

class CommitObject extends StatelessWidget {
  final CommitModel commitModel;
  const CommitObject({Key? key, required this.commitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(commitModel.commit.message);
    return ListTile(
      title: Text(commitModel.commit.message),
    );
  }
}
