import 'package:flutter/material.dart';
import 'package:todo_app/prsentation/pages/all.dart';
import 'package:todo_app/prsentation/pages/compeleted.dart';
import 'package:todo_app/prsentation/pages/favourite.dart';
import 'package:todo_app/prsentation/pages/uncompleted.dart';
import 'package:todo_app/prsentation/screens/add_task_screen.dart';
import 'package:todo_app/prsentation/widgets/custom_button.dart';
import 'package:todo_app/prsentation/widgets/custom_text.dart';
import 'package:todo_app/prsentation/widgets/text_check_box.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  bool onchecked = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextCheckBox(
            text: "Board",
            fontSized: 18,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddTaskScreen()));
              },
              icon: Icon(Icons.calendar_month),
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: TabBar(
                labelColor: Colors.grey,
                indicatorColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  CustomText(text: "All"),
                  CustomText(text: "Completed"),
                  CustomText(text: "Uncompleted"),
                  CustomText(text: "Favorite"),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              child: const TabBarView(
                children: [
                  AllPage(),
                  CompeletedPage(),
                  UnCompeletedPage(),
                  FavoritePage(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
