import 'package:flutter/foundation.dart';
import 'package:to_do/widgets/task_tile.dart';

class Data extends ChangeNotifier {
  List<TaskTile> tasks = [];
  void AddTask(String taskText) {
    var data = TaskTile(
        taskText: taskText,
        onLongPress: () {
          print(taskText);

          this.tasks.removeWhere((element) => element.taskText == taskText);
        });
    tasks.add(data);
  }

  List<TaskTile> GetTask() {
    return tasks;
  }
}
