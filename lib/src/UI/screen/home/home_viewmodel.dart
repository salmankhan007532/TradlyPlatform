import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tradly_platform/src/core/services/api_service.dart';

import '../../../core/models/postModel.dart';

class HomeViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();

  List<PostModel> postModelList = [];

  //constructor
  HomeViewModel() {
    // init();
  }

  //init method

  init() async {
  

    try {
      postModelList = await apiService.getPost();

      print(postModelList.length);
    
      

      // notifyListeners();
      return postModelList;
    } catch (e) {
    
      print("issue in the init method:>> $e");
      notifyListeners();
    }
  }
}
