
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tradly_platform/src/UI/screen/auth/signin_screen.dart';
import 'package:tradly_platform/src/UI/screen/home/home_sreen.dart';

import '../../../core/components/colors.dart';
import '../../../core/components/fontmanager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
FirebaseAuth user = FirebaseAuth.instance;
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(seconds: 2), () {
      if(user.currentUser == null){
        Get.offAll(()=>const SignInScreen());
      }else{
        Get.offAll(()=>const HomeScreen());
      }
      
     
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Center(
        child: manropeText(
          text: "Online Store",
          color: kwhiteColor,
          fontSize: 40.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
