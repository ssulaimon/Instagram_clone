import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instagram_clone/class/firebase_register.dart';
import 'package:instagram_clone/helpers/helper.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email;
  String? password;
  String? username;
  final GlobalKey<FormState> _signupFormkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Create account',
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _signupFormkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Icon(
                  Icons.person,
                  color: white,
                  size: 100,
                ),
                const SizedBox(
                  height: 27,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be blank';
                    } else if (value.length < 5) {
                      return 'username should be more than five character';
                    } else {
                      username = value;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Username",
                    fillColor: grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    focusColor: grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be blank';
                    } else {
                      password = value;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                    fillColor: grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    focusColor: grey,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
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
                          'Next',
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_signupFormkey.currentState!.validate()) {
                        createuser(
                          context: context,
                          email: email!,
                          password: password!,
                          username: username!,
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(
                color: grey,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Log in',
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

Future<void> createuser({
  required String email,
  required String password,
  required BuildContext context,
  required String username,
}) async {
  Authentication authentication = Authentication(
    email: email,
    password: password,
    username: username,
  );
  String? result = await authentication.createAccount();

  if (result == null) {
    var snackBar = const SnackBar(
      content: Text('Your account created please login'),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    var snackBar = SnackBar(
      content: Text(
        result.toString(),
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
