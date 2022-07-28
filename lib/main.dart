import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/business_logic/cubit.dart';
import 'package:todo_app/prsentation/screens/board_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // open the database when the the app starting .
      create: (context) => TaskCubit()..initDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BoardScreen(),
      ),
    );
  }
}
