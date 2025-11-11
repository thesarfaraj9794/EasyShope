import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sarfibazaar/screens/auth-ui/welcome-screen.dart';
import 'package:sarfibazaar/screens/user-panel/all-categories-screen.dart';
import 'package:sarfibazaar/screens/user-panel/all-flash-sale-product.dart';
import 'package:sarfibazaar/screens/user-panel/all-products-screen.dart';
import 'package:sarfibazaar/screens/user-panel/cart-screen.dart';
import 'package:sarfibazaar/utils/app-constant.dart';
import 'package:sarfibazaar/widgets/all-products-widget.dart';
import 'package:sarfibazaar/widgets/banner-widget.dart';
import 'package:sarfibazaar/widgets/category-widget.dart';
import 'package:sarfibazaar/widgets/custom-drawer-widget.dart';
import 'package:sarfibazaar/widgets/flash-sale-widget.dart';
import 'package:sarfibazaar/widgets/heading-widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () =>Get.to(()=>CartScreen()) ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          ),
         
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height /90.0,
            ),
            
            //banners call
            BannerWidget(),
            HeadingWidget(headingTitle: "Categories", 
            headingSubtitle: "According to your choise",
             onTap: ()=>
              Get.to(()=>AllCategoriesScreen()),
             
             buttonText: "See more >"
             ),
             SizedBox(height: 5,),
             CategoriesWidget(),
             HeadingWidget(headingTitle: "Flash Sale", 
            headingSubtitle: "According to your choise",
             onTap: ()=>Get.to(()=>AllFlashSaleProductScreen()), 
             buttonText: "See more >"
             ),
             FlashSaleWidget(),
             HeadingWidget(headingTitle: "All Products", 
            headingSubtitle: "According to your budget",
             onTap: ()=>Get.to(()=>AllProductsScreen()),
             buttonText: "See more >"
             ),
             AllProductsWidget()
             
          
           
          ],
        ),
      ),
    );
  }
}