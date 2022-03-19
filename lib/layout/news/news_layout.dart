import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro11/modules/news_app/search/search.dart';
import 'package:pro11/network/remote/dioHelper.dart';
import 'package:pro11/shared/components.dart';
import 'package:pro11/shared/cubit/cubit.dart';

import 'cubit/newsCubit.dart';
import 'cubit/newsState.dart';

class News_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = newsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).modeTheme();
                  },
                  icon: Icon(
                    Icons.mode_night,
                  )),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    navigatTo(context, seachScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  )),
            ],
          ),
          body: cubit.Screens[cubit.currntIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currntIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
