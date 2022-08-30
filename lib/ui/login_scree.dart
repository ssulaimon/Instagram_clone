import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instagram_clone/class/firebase_register.dart';
import 'package:instagram_clone/helpers/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? email;
    var revealPassword = true;
    String? password;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Instagram',
                style: TextStyle(color: white, fontSize: 25),
              ),
              const SizedBox(
                height: 27,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be blank';
                  } else if (value.contains('@') == false) {
                    return 'Invalid email domain';
                  } else {
                    email = value;
                  }
                },
                decoration: const InputDecoration(
                    hintText: "Email",
                    fillColor: grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: revealPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be blank';
                  } else {
                    password = value;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: grey,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusColor: grey,
                  suffix: GestureDetector(
                    child: const Icon(
                      Icons.password_rounded,
                      color: blue,
                    ),
                    onTap: () {
                      if (revealPassword == true) {
                        setState(() {
                          log(revealPassword.toString());
                          revealPassword = false;
                          log(revealPassword.toString());
                        });
                      } else {
                        setState(() {
                          revealPassword = true;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    loginUser(
                        email: email!, password: password!, context: context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  child: const Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forget login details?',
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      forgetPasswordScreen,
                    ),
                    child: const Text(
                      'Get help logging in.',
                      style: TextStyle(
                        color: white,
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: grey,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(
                context,
                registerScreen,
              ),
              child: const Text(
                'Sign up.',
                style: TextStyle(
                  color: white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> loginUser({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  Authentication authentication =
      Authentication(email: email, password: password);
  String? result = await authentication.loginToAccount();
  if (result == null) {
    Navigator.popAndPushNamed(context, homeScreen);
    var snackBar = const SnackBar(
      content: Text('welcome back'),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    var snackBar = SnackBar(
      content: Text(result),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
