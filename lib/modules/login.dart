import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro11/shared/components.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  Widget build(BuildContext context) {
    var Econtroller = TextEditingController();
    var Pcontroller = TextEditingController();
    var formkey = GlobalKey<FormState>();
    bool itIsPassword = true;
    bool isPassword = true;

    initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Log in "),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Log in ",
                      style: TextStyle(fontSize: 40),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultTextfeiled(
                          controller: Econtroller,
                          keytype: TextInputType.emailAddress,
                          lable: "email",
                          prefix: Icons.email,
                          onSubbmit: (value) {
                            print(Econtroller.text);
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultTextfeiled(
                          controller: Pcontroller,
                          prefix: Icons.lock,
                          lable: "password",
                          suffix: itIsPassword
                              ? Icons.visibility
                              : Icons.visibility_off,

                          ispassword: itIsPassword,
                          suffixPressed: () {
                            setState(() {
                              itIsPassword = !itIsPassword;
                            });
                          },
                          keytype: TextInputType.visiblePassword,
                          // onSubbmit: (value) {
                          //   print(Pcontroller.text);
                          // },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultButten(
                            width: double.infinity,
                            background: Colors.blue,
                            function: () {
                              if (formkey.currentState!.validate()) {
                                print(Econtroller.text);
                                print(Pcontroller.text);
                              }
                            },
                            text: "Login")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
