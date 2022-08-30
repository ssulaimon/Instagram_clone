import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/class/firebase_register.dart';
import 'package:instagram_clone/helpers/helper.dart';

class DrawerModel extends StatefulWidget {
  const DrawerModel({Key? key}) : super(key: key);

  @override
  State<DrawerModel> createState() => _DrawerModelState();
}

class _DrawerModelState extends State<DrawerModel> {
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;
  File? image;

  String? path;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: backgroundColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: image == null
                            ? Image.asset('images/place_holder.png')
                            : Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      // ignore: sort_child_properties_last
                      child: IconButton(
                        onPressed: () async {
                          xFile = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (xFile != null) {
                            setState(() {
                              image = File(xFile!.path);
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: white,
                        ),
                      ),
                      bottom: -12,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Authentication().userName!,
                  style: const TextStyle(
                    color: white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Birdays',
                  style: TextStyle(color: white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Clip & Arts',
                  style: TextStyle(color: white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Stream For a Film',
                  style: TextStyle(color: white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Explore',
                  style: TextStyle(color: white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Find New Friends',
                  style: TextStyle(color: white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'My Friends',
                  style: TextStyle(color: white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Privacy',
                  style: TextStyle(color: white),
                ),
                TextButton(
                    onPressed: () async {
                      String result = await Authentication().logout();
                      if (result == 'done') {
                        Navigator.popAndPushNamed(context, loginScreen);
                      } else {
                        var snackBar = SnackBar(
                          content: Text(result),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: white,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
