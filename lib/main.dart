import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sarfibazaar/controllers/get-device-token-controller.dart';
import 'package:sarfibazaar/screens/auth-ui/splash-screen.dart';
import 'package:sarfibazaar/screens/user-panel/main-screen.dart';

void main() async{
 // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);


   WidgetsFlutterBinding.ensureInitialized();

   //Get.put(GetDeviceTokenController(), permanent: true);

  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyCcYSCq7RZo6hYqmqOzRikx5A-oi9pgddg",
    authDomain: "sarfibazaar1.firebaseapp.com",
    projectId: "sarfibazaar1",
    storageBucket: "sarfibazaar1.firebasestorage.app",
    messagingSenderId: "94031772153",
    appId: "1:94031772153:web:b92440ac9cf40d87692528",
    measurementId: "G-JZ87SNSKRV"
    ),
  );


  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      //enableLog: true,
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}

