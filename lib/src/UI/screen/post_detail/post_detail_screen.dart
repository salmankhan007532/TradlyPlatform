import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tradly_platform/src/UI/screen/post_detail/post_detail_viewmodel.dart';
import 'package:tradly_platform/src/UI/widget/customBackButton.dart';
import 'package:tradly_platform/src/core/models/postModel.dart';

import '../../../core/components/colors.dart';
import '../../../core/components/fontmanager.dart';

class PostDetailScreen extends StatelessWidget {
  PostModel postObject;
  PostDetailScreen({super.key, required this.postObject});

  @override
  Widget build(BuildContext context) {
    print(postObject.body);
    return ChangeNotifierProvider(
      create: (_) => PostDetailViewModel(postObject.id.toString()),
      child: Consumer<PostDetailViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: const Color.fromARGB(221, 238, 229, 229),
          appBar: AppBar(
            leading: CustomBackButton(
              color: kwhiteColor,
            ),
            title: const Text("Post detail"),
            backgroundColor: baseColor,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Card(
                  color: const Color.fromARGB(255, 196, 245, 237),
                    child: ListTile(
                 
                  title: manropeText(text: postObject.title, letterSpacing: 0),
                  subtitle: manropeText(
                    text: postObject.body,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                    color:baseColor
                  ),
                )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding:const EdgeInsets.only(left: 10),
                  child: manropeText(text: "Comments:",fontSize: 20)),
              SizedBox(
                height: 10.h,
              ),
            Expanded(
                  child: model.isLoading?const SpinKitCircle(
                    size: 40,
                    color: Colors.blue,
                  ):ListView.builder(
                    physics:const BouncingScrollPhysics(),
                      itemCount: model.commentsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Card(
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                            leading:const CircleAvatar(
                                  backgroundColor:baseColor,
                                  child: Icon(Icons.person,color: kwhiteColor,
                                  ),
                            ),
                            title: manropeText(
                                    text: model.commentsList[index].name.toString(),
                                    letterSpacing: 0),
                            
                            
                          ),
                           Center(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: manropeText(
                                  text: model.commentsList[index].commentText
                                      .toString(),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: baseColor,
                                  textAlign:TextAlign.justify
                                ),
                             ),
                           ),
                           manropeText(
                                  text: model.commentsList[index].email.toString(),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                  
                            ),
                                ],
                              )),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
