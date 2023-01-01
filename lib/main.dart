import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/commit_screen.dart';
import 'package:flutter_task/model.dart';
import 'package:flutter_task/services.dart';
import 'package:flutter_task/singleObject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<GithubRepoModel>? githubRepos;
  final Services services = Services();

  fetchAllRepos() async {
    githubRepos = await services.fetchRepos(
      context: context,
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: githubRepos == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: githubRepos!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CommitScreen(name: githubRepos![index].name),
                      ),
                    );
                  },
                  child: SingleObject(
                    githubRepoModel: githubRepos![index],
                  ),
                );
              },
            ),
    );
  }
}
