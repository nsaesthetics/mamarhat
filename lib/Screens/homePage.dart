import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mamarhat/Screens/foodPage.dart';
import 'package:mamarhat/Widgets/categoryCardHome.dart';
import 'package:mamarhat/Widgets/forSaleSwiper.dart';
import 'package:mamarhat/Widgets/homePageItems.dart';
import '../Widgets/category.dart';
import 'package:card_swiper/card_swiper.dart';
import 'dart:ui';


enum selectedDrawerTile{
  profile,
  wish,
  order,
  payment,
  call,
  share
}
enum selectedCat{
  medicine,
  laundry,
  gas
}

const activeColor = Color(0xff6b8e28);
const inactiveColor = Colors.white;

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  selectedDrawerTile selected = selectedDrawerTile.profile;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;



    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xff6b8e28),
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'images/logo.svg',
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                selected: selected==selectedDrawerTile.profile?true:false,
                selectedColor: Colors.pink,
                onTap: () {
                  selected = selectedDrawerTile.profile;
                  setState(() {

                  });

                },
                leading: Icon(Icons.account_circle_rounded),
                title: Text('My Profile'),
                focusColor: selected==selectedDrawerTile.profile? Colors.white:Colors.grey,
              ),
              ListTile(
                selected: selected==selectedDrawerTile.wish?true:false,
                selectedColor: Colors.pink,
                onTap: () {
                  selected = selectedDrawerTile.wish;
                  setState(() {

                  });

                },
                leading: Icon(Icons.favorite),
                title: Text('Favourite Restaurant'),
              ),
              ListTile(
                onTap: () {
                  setState(() {});
                },
                leading: Icon(Icons.menu),
                title: Text('Order List'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text('Logout'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.call),
                title: Text('Call Us'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.share),
                title: Text('Share Us'),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
         appBar: AppBar(
           backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder:(context)=> IconButton(icon: Icon(Icons.list, color: Color(0xff6b8e28),size: size.width*0.09,), onPressed: (){
            Scaffold.of(context).openDrawer();
          },),
        ),
      ),
      body: Center(
          child: ListView(
              children:[
                offersSwiper(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.04),
                  child: Row(
                    children: [
                      homeMenu(imageURL: 'images/food.png', menuName: "Order Food", ontap: (){
                        Navigator.pushNamed(context, '/food');
                      },
                      ),
                      homeMenu(imageURL: 'images/grocery.jpg', menuName: "Groceries", ontap: (){
                        Navigator.pushNamed(context, '/grocery');
                      },),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryCardHome(
                        onPressed: () {
                          Navigator.pushNamed(context, '/medicine');
                        },
                        IconImage: "images/medicine.svg",
                        name: "Medicine"),

                    categoryCardHome(
                        onPressed: () {},
                        IconImage: "images/laundry.svg",
                        name: "Laundry"),

                    categoryCardHome(
                        onPressed: () {
                        },
                        IconImage: "images/gas.svg",
                        name: "Gas")


                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:size.width*0.03, vertical:size.height*0.02 ),
                  child: Text("Services", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.05, color: Color(0xff6b8e28), fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height*0.01),
                    child: Bounceable(
                      onTap: (){},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/hotel.jpg"),
                              ),),
                          alignment: Alignment.bottomCenter,
                          width: size.width*0.8,
                          height: size.height*0.25,
                          child: Text("Hotel Booking",
                            style: GoogleFonts.merriweather(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: size.width*0.05
                            ),),
                        ),
                      ),
                    ),
                  ),
                )
              ])

      ),
    );
  }
}
