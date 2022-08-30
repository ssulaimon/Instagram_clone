import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instagram_clone/api_key/data.dart';
import 'package:instagram_clone/helpers/helper.dart';

import '../api_key/api_call.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Data> post = snapshot.data as List<Data>;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 5.0,
                        bottom: 5.0,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: border,
                            radius: 17,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.network(
                                post[index].profilePicture,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            post[index].userName.toString(),
                            style: const TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      post[index].postImages,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.heart_broken,
                            color: white,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Icon(
                            Iconsax.message,
                            color: white,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Icon(
                            Iconsax.share4,
                            color: white,
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Icon(
                            Icons.save_alt,
                            color: white,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        '${post[index].like} likes',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 10),
                      child: Text(
                        'My jaw dropped 😯',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount: post.length,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          } else {
            return const Text('Error');
          }
        }),
        future: ApiCall().apitest(),
      ),
    );
  }
}
