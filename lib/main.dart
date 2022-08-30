import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/helpers/helper.dart';
import 'package:instagram_clone/ui/forget_password_screen.dart';
import 'package:instagram_clone/ui/home_screen.dart';
import 'package:instagram_clone/ui/login_scree.dart';
import 'package:instagram_clone/ui/sign_up_screen.dart';
import 'package:instagram_clone/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      initialRoute: splashscreen,
      routes: {
        splashscreen: (context) => const SplashScreenUi(),
        loginScreen: (context) => const LoginScreen(),
        forgetPasswordScreen: (context) => const ForgetPassword(),
        registerScreen: (context) => const Signup(),
        homeScreen: (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
