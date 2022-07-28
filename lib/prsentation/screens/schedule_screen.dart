// ignore_for_file: deprecated_member_use

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/prsentation/widgets/Custome_container.dart';
import 'package:todo_app/prsentation/widgets/custom_text.dart';

import '../widgets/text_check_box.dart';
import 'board_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: (context) => BoardScreen()));
          },
        ),
        title: TextCheckBox(
            text: "Scheduel", fontSized: 24, fontWeight: FontWeight.w600),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 60,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.green,
              selectedTextColor: Colors.white,
              dateTextStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
              daysCount: 6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextCheckBox(
                    text: "Friday", fontSized: 15, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(text: "22 july 2022"),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    width: 350,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "O.9:OO AM",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white60,
                                fontWeight: FontWeight.bold),
                          ),
                          CheckboxListTile(
                            title: TextCheckBox(
                              text: "Desgin Team Meeting",
                              fontSized: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            controlAffinity: ListTileControlAffinity.platform,
                            activeColor: Colors.amber,
                            value: isChecked,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            onChanged: (value) {
                              setState(
                                () {
                                  isChecked = value!;
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
