import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/business_logic/cubit.dart';
import 'package:todo_app/business_logic/state.dart';
import 'package:todo_app/prsentation/widgets/reusable_task_list.dart';

import '../widgets/text_check_box.dart';

class AllPage extends StatefulWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    bool onchecked = false;
    return BlocBuilder<TaskCubit, TaskStates>(
      builder: (context, state) => Scaffold(
          body: ListView.builder(
        itemCount: TaskCubit.get(context).allTasks.length,
        itemBuilder: ((context, index) => ReusableTaskList(
              allTasks: TaskCubit.get(context).allTasks[index],
            )),
      )),
    );
  }
}
