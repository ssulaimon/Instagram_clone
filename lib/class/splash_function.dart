import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/class/firebase_register.dart';
import 'package:instagram_clone/helpers/helper.dart';

Future<void> pushToNextScreen({required BuildContext context}) {
  return Future.delayed(
    const Duration(
      seconds: 5,
    ),
    () {
      Authentication authentication = Authentication();
      if (authentication.auth.currentUser != null) {
        Navigator.popAndPushNamed(
          context,
          homeScreen,
        );
      } else {
        Navigator.popAndPushNamed(
          context,
          loginScreen,
        );
      }
    },
  );
}
