import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:instagram_clone/api_key/data.dart';

class ApiCall {
  Future<List<Data>?> apitest() async {
    var url = Uri.parse(
        'https://api.unsplash.com/photos?client_id=PeY57lE0nQ5-Gqz9UR_Gh6NHpDGYUR9bCMYrmJTJEO4');

    Response response = await get(url);
    if (response.statusCode == 200) {
      List items = await jsonDecode(response.body);

      return List.generate(items.length, (index) {
        return Data(
          userName: items[index]['user']['instagram_username'],
          postImages: items[index]['urls']['small'],
          profilePicture: items[index]['user']['profile_image']['medium'],
          like: items[index]['likes'],
        );
      });
    } else {
      response.statusCode.toString();
    }
  }
}
