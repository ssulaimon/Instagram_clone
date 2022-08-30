import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/class/firebase_register.dart';
import 'package:instagram_clone/helpers/helper.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _registerFormkey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        title: const Text(
          'Login help',
        ),
        elevation: 0.0,
      ),
      body: Form(
        key: _registerFormkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Find your account',
                style: TextStyle(
                  color: white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter your email linked to your account',
                style: TextStyle(
                  color: grey,
                ),
              ),
              const SizedBox(
                height: 20,
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
                height: 20,
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
                  if (_registerFormkey.currentState!.validate()) {
                    forgetPassword(email: email!, context: context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
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

Future<void> forgetPassword(
    {required String email, required BuildContext context}) async {
  Authentication authentication = Authentication(email: email);
  String? result = await authentication.forgetPassword();
  if (result == null) {
    var snackBar = const SnackBar(
      content: Text('Password restlink sent'),
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
