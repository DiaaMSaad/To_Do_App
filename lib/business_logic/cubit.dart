import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/business_logic/state.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitialStates());

  static TaskCubit get(context) => BlocProvider.of<TaskCubit>(context);

  late Database database;
  List<Map> allTasks = [];
  List<Map> unCompletedTasks = [];
  List<Map> completedTasks = [];
  List<Map> favTasks = [];

  void initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'task.db');

    openAppDatabase(
      path: path,
    );

    emit(AppDatabaseInitialized());
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'create table tasks (id integer PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT, fav Text)');
      },
      onOpen: (Database db) {
        database = db;

        getUsersData();
      },
    );
  }

  bool theNew = false;
  bool favorite = false;

  void insertUserData({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String remind,
    required String report,
  }) {
    database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks (title , date , startTime ,  endTime , report , remind ,status , fav) VALUES("$title","$date","$startTime","$endTime","$report","$remind","$theNew", "$favorite")');
    }).then((value) {
      getUsersData();

      emit(AppDatabaseUserCreated());
    });
  }

  List<Map> users = [];

  void getUsersData() async {
    unCompletedTasks = [];
    completedTasks = [];
    favTasks = [];
    allTasks = [];

    database.rawQuery('SELECT * FROM tasks').then((value) {
      allTasks.addAll(value);

      value.forEach((element) {
        if (element['fav'] == 'favorite') {
          favTasks.add(element);
        }

        if (element['status'] == 'new') {
          unCompletedTasks.add(element);
        } else if (element['status'] == 'done') {
          completedTasks.add(element);
        }
      });
      emit(GetDateFromDatabaseStates());
    });
  }

  //Update data from database

  void updateFav({required String fav, required int id}) {
    database.rawUpdate(
        'UPDATE tasks SET fav = ? WHERE id = ? ', ['$fav', id]).then((value) {
      getUsersData();
      emit(UpdateTaskStates());
    });
    void deleteTask({required int id}) {
      database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
        getUsersData();
        emit(DeleteTaskStates());
      });
    }
//end delete from database
  }
}
