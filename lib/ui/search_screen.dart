import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/api_key/api_call.dart';
import 'package:instagram_clone/api_key/data.dart';
import 'package:instagram_clone/helpers/helper.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                  fillColor: grey,
                  filled: true,
                  prefix: Icon(
                    Icons.search,
                    color: backgroundColor,
                  ),
                  hintText: 'Search'),
            ),
          ),
        ],
        backgroundColor: backgroundColor,
      ),
      body: FutureBuilder(
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<Data> items = snapShot.data as List<Data>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    20.0,
                  )),
                  height: 100,
                  width: 100,
                  child: Image.network(
                    items[index].postImages,
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: items.length,
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
        future: ApiCall().apitest(),
      ),
    );
  }
}
