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
      final response = await http.get(Uri.parse(postUrl));

      print(response.statusCode);

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var value in data) {
          postModelList.add(PostModel(
              title: value["title"],
              body: value["body"],
              userId: value["userId"],
              id: value["id"]));
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

  // comment

  getComments(String postId) async {
    List<CommentsModel> commentsList = [];
    try {
      final response = await http.get(Uri.parse("$postUrl/$postId/comments"));

      print(response.statusCode);

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        for (var value in data) {
          commentsList.add(CommentsModel(
            name: value["name"],
            commentText: value["body"],
            email: value["email"],
          ));
        }
        print(commentsList.length);
        return commentsList;
      } else {
        return commentsList;
      }
    } catch (e) {
      print("Some issue in the get comment request$e");
    }
  }
}
