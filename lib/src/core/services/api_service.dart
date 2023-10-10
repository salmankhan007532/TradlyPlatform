import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tradly_platform/src/core/components/constant.dart';
import 'package:tradly_platform/src/core/models/commentsModel.dart';
import 'package:tradly_platform/src/core/models/postModel.dart';

class ApiService {
  // get request
  getPost() async {
    List<PostModel> postModelList = [];
    try {
      final response = await http.get(Uri.parse(storeUrl));

      print(response.statusCode);

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var value in data) {
          postModelList.add(PostModel(
              title: value["title"],
              price: value["prince"],
              image: value["image"],
              category: value["category"],
              description: value["description"],
              
              ));
        }
        //  print(postModelList.length);
        return postModelList;
      } else {
        return postModelList;
      }
    } catch (e) {
      print("Some issue in the get post request$e");
    }
  }

}
