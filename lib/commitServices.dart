import 'dart:convert';

import 'package:flutter_task/commit_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'error_handling.dart';

class CommitServices{
  Future<List<CommitModel>> fetchCommits({
    required BuildContext context,
    required String name,
  }) async {
    List<CommitModel> commits = [];
    try {
      http.Response res = await http.get(
        Uri.parse('https://api.github.com/repos/Siddhesh199/$name/commits'),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print(jsonDecode(res.body).length);
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            print('Hello');
            commits.add(
              CommitModel.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return commits;
  }
}