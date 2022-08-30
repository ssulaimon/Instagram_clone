import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/api_key/api_call.dart';
import 'package:instagram_clone/api_key/data.dart';
import 'package:instagram_clone/helpers/helper.dart';
import 'package:instagram_clone/ui/drawer_model.dart';
import 'package:instagram_clone/ui/home.dart';
import 'package:instagram_clone/ui/like_ui.dart';
import 'package:instagram_clone/ui/post_list.dart';
import 'package:instagram_clone/ui/reels_ui.dart';
import 'package:instagram_clone/ui/search_screen.dart';
import 'package:instagram_clone/ui/story_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> navigation = const [
    HomeList(),
    SearchScreen(),
    ReelsUi(),
    LikeUi(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: navigation[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: white,
        unselectedItemColor: white,
        backgroundColor: backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: '',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
