

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:sarfibazaar/controllers/get-user-data-controller.dart';
import 'package:sarfibazaar/screens/admin-panel/admin-main-screen.dart';
import 'package:sarfibazaar/screens/auth-ui/sign-in-screen.dart';
import 'package:sarfibazaar/screens/auth-ui/welcome-screen.dart';
import 'package:sarfibazaar/screens/user-panel/main-screen.dart';
import 'package:sarfibazaar/utils/app-constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  User? user=FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // 3 सेकंड बाद MainScreen पर जाना
    Timer( Duration(seconds: 3), () {
      loggdin(context);
    });
  }
  Future<void> loggdin(BuildContext context)async{
    if(user!=null){
      final GetUserDataController getUserDataController =Get.put(GetUserDataController());

      var userData =await  getUserDataController.getUserData(user!.uid);
      if(userData[0]['isAdmin']==true){
        Get.offAll(()=>AdminMainScreen());

      }else{
        Get.offAll(()=>MainScreen());

      }

    }else{
      Get.to(()=>WelcomeScreen());

    }
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
      ),

      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                 width: Get.width,
                 alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash-icon.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                "Sarfi Bazaar",
                style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
