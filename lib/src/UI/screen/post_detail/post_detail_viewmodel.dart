import 'package:flutter/foundation.dart';
import 'package:tradly_platform/src/core/models/commentsModel.dart';
import 'package:tradly_platform/src/core/services/api_service.dart';

class PostDetailViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<CommentsModel> commentsList = [];
  bool isLoading=false;
  PostDetailViewModel(String postId) {
    getComments(postId);
  }

  getComments(String postId) async {
    isLoading=true;
    try {
      commentsList = await apiService.getComments(postId);
      isLoading=false;
      notifyListeners();
    } catch (e) {
      isLoading=false;
      print("error in getComments()=>+$e");
    }
  }
}
