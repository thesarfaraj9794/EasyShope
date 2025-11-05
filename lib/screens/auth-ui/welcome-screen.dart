// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

//import 'package:e_comm/screens/auth-ui/sign-in-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sarfibazaar/controllers/google-sign-in-controller.dart';
import 'package:sarfibazaar/screens/auth-ui/sign-in-screen.dart';
//import '../../controllers/google-sign-in-controller.dart';
import '../../utils/app-constant.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
     Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appScendoryColor,
          title: Text(
            "Welcome to my app",
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
               
                  
                  child: Lottie.asset('assets/images/splash-icon.json'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Happy Shopping",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Material(
                  child: Container(
                    width: Get.width / 1.2,
                    height: Get.height / 12,
                    decoration: BoxDecoration(
                      color: AppConstant.appScendoryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.email,
                        color: AppConstant.appTextColor,
                      ) ,
                      // icon: Image.asset(
                  
                      label: Text(
                        "Sign in with google",
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                      onPressed: () {
                        _googleSignInController.signInWithGoogle();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Material(
                  child: Container(
                    width: Get.width / 1.2,
                    height: Get.height / 12,
                    decoration: BoxDecoration(
                      color: AppConstant.appScendoryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.email,
                        color: AppConstant.appTextColor,
                      ),
                      label: Text(
                        "Sign in with email",
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                      onPressed: () {
                        Get.to(() => SigninScreen());
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}