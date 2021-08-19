import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/cubit/states.dart';
import 'package:todo_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  
  bool isDarkMod = false;

  void changeMode({bool? fromShared}){
    if(fromShared != null){
      isDarkMod = fromShared;
    }else{
      isDarkMod = !isDarkMod;
    }
    CacheHelper.putData(key: 'isDarkMod', value: isDarkMod).then((value){
      emit(AppChangeModeState());
    });
  }
}