import 'package:flutter/material.dart';

import '../widgets/text_check_box.dart';

class ReusableTaskList extends StatefulWidget {
  final Map allTasks;

  const ReusableTaskList({Key? key, required this.allTasks}) : super(key: key);

  @override
  State<ReusableTaskList> createState() => _ReusableTaskListState();
}

class _ReusableTaskListState extends State<ReusableTaskList> {
  @override
  Widget build(BuildContext context) {
    bool onchecked = false;
    return Scaffold(
      body: CheckboxListTile(
        title: TextCheckBox(
          text: "${widget.allTasks["title"]}",
          fontSized: 15,
          fontWeight: FontWeight.bold,
        ),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.red,
        value: onchecked,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onChanged: (value) {
          setState(
            () {
              onchecked = value!;
            },
          );
        },
      ),
    );
  }
}
