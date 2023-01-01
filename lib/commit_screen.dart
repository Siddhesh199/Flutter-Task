import 'package:flutter/material.dart';
import 'package:flutter_task/commitObject.dart';
import 'package:flutter_task/commitServices.dart';
import 'package:flutter_task/commit_model.dart';

class CommitScreen extends StatefulWidget {
  final String name;
  const CommitScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<CommitScreen> createState() => _CommitScreenState();
}

class _CommitScreenState extends State<CommitScreen> {
  List<CommitModel>? commits;
  final CommitServices services = CommitServices();

  fetchAllCommits() async {
    commits = await services.fetchCommits(
      name: widget.name,
      context: context,
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllCommits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commits'),
      ),
      body: commits == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: commits!.length,
        itemBuilder: (context, index) {
          return CommitObject(commitModel: commits![index]);
        },
      ),
    );
  }
}
