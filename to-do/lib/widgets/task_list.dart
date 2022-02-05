import 'package:flutter/material.dart';
import 'package:to_do/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  TaskList({required this.tasks});
  final List<TaskTile> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks,
    );
  }
}
