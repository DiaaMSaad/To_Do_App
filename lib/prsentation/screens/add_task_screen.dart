// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/business_logic/cubit.dart';
import 'package:todo_app/prsentation/screens/board_screen.dart';
import 'package:todo_app/prsentation/screens/schedule_screen.dart';
import 'package:todo_app/prsentation/widgets/My_text_form_field.dart';
import 'package:todo_app/prsentation/widgets/custom_button.dart';
import 'package:todo_app/prsentation/widgets/text_form_field_picker.dart';
import '../widgets/Picker_time_Text_form.dart';
import '../widgets/text_check_box.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

TextEditingController textTitleEditingController = TextEditingController();
TextEditingController dateEditingController = TextEditingController();
TextEditingController startEditingController = TextEditingController();
TextEditingController endEditingController = TextEditingController();
TextEditingController remindEditingController = TextEditingController();
TextEditingController reportEditingController = TextEditingController();

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScheduleScreen()));
          },
        ),
        title: TextCheckBox(
            text: "Add task", fontSized: 24, fontWeight: FontWeight.w600),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCheckBox(
                    text: "Title", fontSized: 20, fontWeight: FontWeight.bold),
                SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                  hintText: "Design Team Meeting",
                  textEditingController: textTitleEditingController,
                ),
                SizedBox(
                  height: 40,
                ),
                TextCheckBox(
                    text: "Date", fontSized: 20, fontWeight: FontWeight.bold),
                SizedBox(
                  height: 20,
                ),
                PickerDateTextFormField(
                  hintText: "Press to choose Date",
                  textEditingController: dateEditingController,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCheckBox(
                              text: "Start time",
                              fontSized: 20,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            height: 10,
                          ),
                          PickerTimeTextFormField(
                            hintText: "11.OO AM",
                            textEditingController: startEditingController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCheckBox(
                              text: "End time",
                              fontSized: 20,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            height: 10,
                          ),
                          PickerTimeTextFormField(
                            hintText: "13.OO AM",
                            textEditingController: endEditingController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                TextCheckBox(
                    text: "Remind", fontSized: 20, fontWeight: FontWeight.bold),
                SizedBox(
                  height: 20,
                ),
                PickerTimeTextFormField(
                  hintText: "10 Minutes Early",
                  textEditingController: remindEditingController,
                ),
                SizedBox(
                  height: 40,
                ),
                TextCheckBox(
                    text: "Report", fontSized: 20, fontWeight: FontWeight.bold),
                SizedBox(
                  height: 20,
                ),
                PickerTimeTextFormField(
                  hintText: "Weekly",
                  textEditingController: reportEditingController,
                ),
                SizedBox(
                  height: 70,
                ),
                MyButton(
                  text: "Create a Task",
                  onPressed: () {
                    TaskCubit.get(context).insertUserData(
                        title: textTitleEditingController.text,
                        date: dateEditingController.text,
                        startTime: startEditingController.text,
                        endTime: endEditingController.text,
                        remind: remindEditingController.text,
                        report: reportEditingController.text);

                    debugPrint("${TaskCubit.get(context).allTasks}");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BoardScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
