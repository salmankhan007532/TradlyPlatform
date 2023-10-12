import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:tradly_platform/src/UI/screen/home/home_viewmodel.dart';
import 'package:tradly_platform/src/UI/screen/item_detail/item_detail_screen.dart';
import 'package:tradly_platform/src/core/components/fontmanager.dart';

import '../../../core/components/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context,model,child)=>
       Scaffold(
        backgroundColor: const Color.fromARGB(221, 238, 229, 229),
          appBar: AppBar(title: const Text("Store"),
          backgroundColor:baseColor,),
          body: FutureBuilder(
            future: model.init(),
            builder: (context,snapshot)
            {
              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return  SpinKitCircle(
                  size: 40.sp,
                  color: Colors.blue,
                );

              }
              else if(snapshot.hasData)
              {
                return ListView.builder(
                  itemCount:model.postModelList.length,
                  physics:const BouncingScrollPhysics(),
                  itemBuilder: (context,index)
                  {
                   
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      child: Card(
                        elevation: 3,
                        color:const Color.fromARGB(255, 196, 245, 237),
                        child:ListTile(
                        onTap:()
                        {
                         Get.to(()=> ItemDetailScreen(itemDetailObj: model.postModelList[index],));
                        },
                        title:manropeText(text: "Title : ${model.postModelList[index].title.toString()}",
                        letterSpacing:0,
                        fontSize: 18
                        ),
                        // subtitle:manropeText(text: model.postModelList[index].price.toString().substring(0,101),
                        // letterSpacing:0,
                        // fontWeight: FontWeight.w100,
                        // fontSize:15,
                        // color:const Color.fromARGB(255, 49, 45, 45),
                        // ),
                        subtitle: Text( " RS: ${model.postModelList[index].price.toString()}"),
                        leading: Image.network( model.postModelList[index].image.toString(),fit: BoxFit.cover,),
                    
                        )
                      ),
                    );

                  },
                );
              }
              else 
              {
                return const SizedBox();
              }
            },
          )
        ),
      ),
    );
  }
}