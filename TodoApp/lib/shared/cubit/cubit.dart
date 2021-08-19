import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/modules/todo_app/Done_Tasks/done_tasks.dart';
import 'package:todo_app/modules/todo_app/New_Tasks/new_tasks.dart';
import 'package:todo_app/modules/todo_app/Tasks_Archive/archive_tasks.dart';
import 'package:todo_app/shared/cubit/states.dart';
import 'package:todo_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [NewTask(), DoneTask(), ArchiveTask()];
  List<String> titles = ['New Task', 'Done Task', 'Archive Task'];

  void newIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void createDB() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print('database Created');
        try {
          await database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
          print('table created');
        } catch (e) {
          print(e);
        }
      },
      onOpen: (database) {
        getDataFromDB(database);
        print('Database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDBState());
    });
  }

  bool isBottomSheet = false;
  IconData fbIcon = FontAwesomeIcons.pen;

  Future insertDB({
    @required String? title,
    @required String? time,
    @required String? date
  }) async {
    return await database!.transaction((txn) async {
      try {
        await txn.rawInsert('INSERT INTO tasks(title,date,time,status)'
            'VALUES("$title","$date","$time","new")');
        print('inserted successfully');
        emit(AppInsertDBState());
        getDataFromDB(database).then((value) {
          newTasks = value;
          print(newTasks);
          emit(AppGetDBState());
        });
      } catch (e) {
        print(e);
      }
    });
  }

  getDataFromDB(database)  {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AppGetLoadingDBState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status'] == 'new'){
          newTasks.add(element);
        } else if(element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(AppGetDBState());
    });
  }

  updateDB({@required String? status, @required int? id}) {
    database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?', ['$status', id]
    ).then((value){
          getDataFromDB(database);
          emit(AppUpdateDBState());
    });
  }

  deleteData({@required int? id}){
    return database!.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value){
      getDataFromDB(database);
      emit(AppDeleteDBState());
    });
  }

  void changeBottomSheetState ({
    required bool isShow,
    required IconData icon,
  }){
    isBottomSheet = isShow;
    fbIcon = icon;
    emit(AppChangeBottomSheetState());
  }
