import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({required this.taskText, required this.onLongPress});
  final Function onLongPress;
  final String taskText;
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isCheckBox = false;

  void onChange(bool value) {
    setState(() {
      this.isCheckBox = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: () {
          setState(() {
            widget.onLongPress();
          });
        },
        title: Text(
          widget.taskText,
          style: TextStyle(
              decoration: isCheckBox ? TextDecoration.lineThrough : null),
        ),
        trailing: TaskWidget(
          isCheckTrue: isCheckBox,
          onChange: onChange,
        ));
  }
}

class TaskWidget extends StatelessWidget {
  TaskWidget({required this.isCheckTrue, required Function this.onChange});
  final bool isCheckTrue;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: (value) {
        onChange(value);
      },
      value: isCheckTrue,
    );
  }
}
