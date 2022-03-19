import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro11/modules/shop_app/ShopLogin/cubit/shopLoginCubit.dart';
import 'package:pro11/modules/shop_app/ShopLogin/cubit/shopLoginState.dart';
import 'package:pro11/modules/shop_app/shopRegister/shopRegister.dart';
import 'package:pro11/network/local/cache_helper.dart';
import 'package:pro11/shared/components.dart';
import 'package:pro11/styles/colors.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => shopLoginCubit(),
      child: BlocConsumer<shopLoginCubit, shopLoginState>(
        listener: (context, state) {
          if (state is shopLoginStateSuccess) {
            if (state.model.status) {
              print(state.model.message);
              CacheHelper.saveData(
                  key: "token", value: state.model.data!.token);
            } else {
              print(state.model.message);
              Fluttertoast.showToast(
                  msg: state.model.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextfeiled(
                            controller: emailController,
                            keytype: TextInputType.emailAddress,
                            lable: "Email Address",
                            prefix: Icons.email_outlined,
                            onSubbmit: () {},
                            validate: (String value) {
                              if (value == null || value.isEmpty) {
                                return " Please enter your Email ";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextfeiled(
                            controller: passwordController,
                            keytype: TextInputType.visiblePassword,
                            lable: "Password",
                            prefix: Icons.lock_outline,
                            ispassword: shopLoginCubit.get(context).isPassword,
                            suffix: shopLoginCubit.get(context).suffix,
                            suffixPressed: () {
                              shopLoginCubit
                                  .get(context)
                                  .shopChangePasswordVisibility();
                            },
                            onSubbmit: () {},
                            validate: (String value) {
                              if (value == null || value.isEmpty) {
                                return " Please enter your Password ";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! shopLoginStateLoading,
                          builder: (context) => defaultButten(
                              width: double.infinity,
                              background: defautColor,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  shopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: "Login"),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Don\'t have an account?"),
                            TextButton(
                                onPressed: () {
                                  navigatTo(context, shopRegister());
                                },
                                child: Text("Register now!")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
