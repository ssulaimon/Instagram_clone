import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/class/firebase_register.dart';

import '../helpers/helper.dart';
import 'drawer_model.dart';
import 'post_list.dart';
import 'story_list.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: blue,
        child: DrawerModel(),
      ),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Instagram',
        ),
        backgroundColor: backgroundColor,
        actions: const [
          Icon(
            Icons.message,
            color: white,
          )
        ],
      ),
      body: Column(children: const [
        Story(),
        PostList(),
      ]),
      backgroundColor: backgroundColor,
    );
  }
}
