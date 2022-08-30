import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/api_key/api_call.dart';
import 'package:instagram_clone/api_key/data.dart';
import 'package:instagram_clone/helpers/helper.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Data> stories = snapshot.data as List<Data>;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: border,
                    radius: 26,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        stories[index].profilePicture,
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
              itemCount: stories.length,
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
