import 'package:pro11/models/shop_app/login_model.dart';

abstract class shopLoginState {}

class shopLoginStateInitial extends shopLoginState {}

class shopLoginStateLoading extends shopLoginState {}

class shopLoginStateSuccess extends shopLoginState {
  final shopLoginModel model;

  shopLoginStateSuccess(this.model);
}

class shopLoginStateError extends shopLoginState {
  final String error;

  shopLoginStateError(this.error);
}

class shopLoginChangePassworVisibility extends shopLoginState {}
