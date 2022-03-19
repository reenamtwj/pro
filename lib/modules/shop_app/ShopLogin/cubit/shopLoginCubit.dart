import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro11/modules/shop_app/ShopLogin/cubit/shopLoginState.dart';
import 'package:pro11/network/end_points/end_points.dart';
import 'package:pro11/network/remote/dioHelper.dart';

import '../../../../models/shop_app/login_model.dart';

class shopLoginCubit extends Cubit<shopLoginState> {
  shopLoginCubit() : super(shopLoginStateInitial());

  static shopLoginCubit get(context) => BlocProvider.of(context);

  late shopLoginModel login;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(shopLoginStateLoading());

    DioHelper.postDate(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      //  print(value.data);

      login = shopLoginModel.fromJson(value.data);

      emit(shopLoginStateSuccess(login));
    }).catchError((Error) {
      print(Error.toString());
      emit(shopLoginStateError(Error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off;

  void shopChangePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(shopLoginChangePassworVisibility());
  }
}
