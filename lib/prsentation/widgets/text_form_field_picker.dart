import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class PickerDateTextFormField extends StatelessWidget {
  final String hintText;
  final double radius;
  final TextEditingController textEditingController;

  PickerDateTextFormField({
    required this.hintText,
    this.radius = 5,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                suffix: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                ))));
  }
}
