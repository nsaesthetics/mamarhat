import 'package:flutter/material.dart';
import 'package:mamarhat/Screens/RestaurantDetailPage.dart';
import 'package:mamarhat/Screens/cartPage.dart';
import 'package:mamarhat/Screens/pharmacyDetails.dart';
import './Screens/groceryPage.dart';
import './Screens/medicinePage.dart';
import './Screens/foodPage.dart';
import './Screens/loginPage.dart';
import './Screens/signUp.dart';
import './Screens/homePage.dart';

void main() {
  runApp(
      MaterialApp
        (
        routes: {
          '/login' :(context) => loginPage(),
          '/signup' :(context) => signUp(),
          '/home':(context) => HomePage(),
          '/food': (context) => foodPage(),
          '/grocery':(context) => groceryPage(),
          '/medicine':(context) => medicinePage(),
          '/pharmadetails' : (context)=>pharmacyDetails(),
          '/restaurant':(context)=> restaurantDetail(),
          '/cart':(context)=>cartPage()
        },
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xff6b8e28),
          fontFamily: 'Georgia'
        ),
        title: "Mamarhat",
        home: Scaffold(
          backgroundColor: Colors.white,
          body: loginPage(),

        ),

      ));
}
