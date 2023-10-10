import 'package:flutter/foundation.dart';
import 'package:tradly_platform/src/core/models/commentsModel.dart';
import 'package:tradly_platform/src/core/services/api_service.dart';

class PostDetailViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<CommentsModel> commentsList = [];
  bool isLoading=false;

}
