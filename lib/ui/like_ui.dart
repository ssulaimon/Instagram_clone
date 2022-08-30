import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/api_key/api_call.dart';
import 'package:instagram_clone/api_key/data.dart';
import 'package:instagram_clone/helpers/helper.dart';

class LikeUi extends StatelessWidget {
  const LikeUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Notifications",
          style: TextStyle(color: white),
        ),
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder(
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<Data> items = snapShot.data as List<Data>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Today',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    28,
                                  ),
                                  child: Image.network(
                                      items[index].profilePicture)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                '${items[index].userName} started follwing you',
                                style: const TextStyle(
                                  color: white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                'Following',
                                style: TextStyle(
                                  color: white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: items.length,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
        future: ApiCall().apitest(),
      ),
    );
  }
}
