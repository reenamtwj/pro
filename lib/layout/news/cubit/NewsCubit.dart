import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:pro11/layout/news/cubit/NewsState.dart';
import 'package:pro11/layout/news/cubit/newsState.dart';
import 'package:pro11/modules/news_app/business/businessScreen.dart';
import 'package:pro11/modules/news_app/science/scienceScreen.dart';
import 'package:pro11/modules/news_app/sports/sports.dart';

import 'package:pro11/network/remote/dioHelper.dart';

//import 'NewsState.dart';

class newsCubit extends Cubit<NewsStates> {
  newsCubit() : super(NewsInitialState());

  static newsCubit get(context) => BlocProvider.of(context);

  int currntIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  List<Widget> Screens = [
    businssScreen(),
    sportsScreen(),
    scienceScreen(),
  ];

  bool isDark = false;

  void changeBottomNav(int index) {
    currntIndex = index;
    if (currntIndex == 1) getSport();
    if (currntIndex == 2) getScienc();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusinss() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getDate(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'eb0fceb5d881475f8b16c8c3c241d2ff'
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  List<dynamic> sport = [];
  void getSport() {
    emit(NewsGetSportLoadingState());

    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'sources': 'techcrunch',
      'apiKey': 'eb0fceb5d881475f8b16c8c3c241d2ff'
    }).then((value) {
      sport = value.data['articles'];
      print(sport[0]['title']);
      emit(NewsGetSportSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSportErrorState(onError));
    });
  }

  List<dynamic> scince = [];
  void getScienc() {
    emit(NewsGetScinceLoadingState());

    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'sources': 'techcrunch',
      'apiKey': 'eb0fceb5d881475f8b16c8c3c241d2ff'
    }).then((value) {
      scince = value.data['articles'];
      print(scince[0]['title']);
      emit(NewsScienceSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetScineceErrorState(onError));
    });
  }

  List<dynamic> search = [];

  void getsearch({required String value}) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getDate(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'eb0fceb5d881475f8b16c8c3c241d2ff',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSearchErrorState(onError.toString()));
    });
  }

  static settingScreen() {}
}
