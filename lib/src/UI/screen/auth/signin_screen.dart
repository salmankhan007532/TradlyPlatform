import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tradly_platform/src/UI/screen/auth/signUp_screen.dart';
import 'package:tradly_platform/src/UI/screen/home/home_sreen.dart';
import 'package:tradly_platform/src/UI/widget/Custom_textField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController,
              hintText: "Email",),
            SizedBox(height: 8.sp,),
            CustomTextField(
              controller: passwordController,
              hintText: "Password",),
            SizedBox(height: 30.sp,),
      
            ElevatedButton(
              onPressed: (){
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signInWithEmailAndPassword(
                  email: emailController.text.trim(), 
                  password: passwordController.text.trim()
                  ).then((value) {
                    Get.to(const HomeScreen());
                  }).onError((error, stackTrace) {
                    print("**************************");
                    print("The error is : $error");
                  });
              },
              child: const Text("Sign In")),
              SizedBox(height: 20.sp,),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not have account"),
                  TextButton(
                    onPressed: (){
                      Get.to(const SignUpScreen());
                    },
                    child: const Text("Sign Up",style: TextStyle(color: Colors.blue),)),
                ],
              ),
      
          ],
        ),
      )
      ),
    );

  }
}