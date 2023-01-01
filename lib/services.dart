import 'dart:convert';

import 'package:flutter_task/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'error_handling.dart';

class Services{
  Future<List<GithubRepoModel>> fetchRepos({
    required BuildContext context,
  }) async {
    List<GithubRepoModel> githubRepos = [];
    try {
      http.Response res = await http.get(
        Uri.parse('https://api.github.com/users/Siddhesh199/repos'),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            githubRepos.add(
              GithubRepoModel.fromJson(
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
    return githubRepos;
  }
}