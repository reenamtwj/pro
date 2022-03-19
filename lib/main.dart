import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro11/layout/home_layout.dart';
//import 'package:pro11/layout/news/cubit/NewsCubit.dart';
//import 'package:pro11/layout/news/cubit/NewsState.dart';
//import 'package:pro11/layout/news/cubit/newsCubit.dart';
import 'package:pro11/layout/news/news_layout.dart';
import 'package:pro11/layout/shop_layout/shop_layout.dart';
import 'package:pro11/network/local/cache_helper.dart';
import 'package:pro11/network/remote/dioHelper.dart';
import 'package:pro11/shared/blocObserver.dart';
import 'package:bloc/bloc.dart';
import 'package:pro11/shared/cubit/cubit.dart';
import 'package:pro11/shared/cubit/state.dart';
import 'package:pro11/styles/themes.dart';

import 'layout/news/cubit/newsCubit.dart';
import 'layout/news/cubit/newsState.dart';
import 'modules/login.dart';
import 'modules/shop_app/ShopLogin/shopLogin.dart';
import 'modules/shop_app/onBoard/OnBoard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocObserver myObserver = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: "onBoarding ");
  late Widget widget;

  dynamic token = CacheHelper.getData(key: "token");

  if (onBoarding != null) {
    if (token != null) {
      widget = shop_layout_screen();
    } else {
      widget = ShopLoginScreen();
    }
    widget = OnBoardScreen();
  }

  runApp(MyApp(isDark, widget));
}

class MyApp extends StatelessWidget {
  ////////////////////////////////////// test
  late final bool? isDark;
  late final Widget startWidget;
  MyApp(this.isDark, this.startWidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..modeTheme(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => newsCubit()..getBusinss(),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LightTheme,
              darkTheme: DarkTheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: startWidget,
            );
          },
          listener: (context, state) {}),
    );
  }
}
