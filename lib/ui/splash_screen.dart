import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/class/splash_function.dart';
import 'package:instagram_clone/helpers/helper.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({Key? key}) : super(key: key);

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pushToNextScreen(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          backgroundImage,
          width: 100,
          height: 100,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
