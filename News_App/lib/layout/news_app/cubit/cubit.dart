import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/news_app/cubit/states.dart';
import 'package:todo_app/modules/news_app/business/business_screen.dart';
import 'package:todo_app/modules/news_app/sciences/sciences_screen.dart';
import 'package:todo_app/modules/news_app/sports/sports_screen.dart';
import 'package:todo_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_rounded), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science), label: 'Sciences'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index == 0) getBusiness();
    if(index == 1) getSports();
    if(index == 2) getSciences();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'3da4e527a4fb427293b4e24a9924b289',
        }
    ).then((value){
      print(value.data.toString());
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessFailedState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports(){
    emit(NewsGetSportsLoadingState());
    if(sports.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'sports',
            'apiKey':'3da4e527a4fb427293b4e24a9924b289',
          }
      ).then((value){
        print(value.data.toString());
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsFailedState(error.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }


  }

  List<dynamic> science = [];

  void getSciences(){
    emit(NewsGetSciencesLoadingState());

    if(science.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'science',
            'apiKey':'3da4e527a4fb427293b4e24a9924b289',
          }
      ).then((value){
        print(value.data.toString());
        science = value.data['articles'];
        emit(NewsGetSciencesSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSciencesFailedState(error.toString()));
      });
    }else{
      emit(NewsGetSciencesSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value){

    emit(NewsGetSearchLoadingState());

    search = [];

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'3da4e527a4fb427293b4e24a9924b289',
        }
      ).then((value){
        print(value.data.toString());
        search = value.data['articles'];
        emit(NewsGetSearchSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSearchFailedState(error.toString()));
      });
  }


}