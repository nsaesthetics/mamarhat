import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mamarhat/Widgets/foodItemsCard.dart';
import 'package:mamarhat/Widgets/groceryCategory.dart';
import 'package:mamarhat/Widgets/groceryItemList.dart';
import 'package:mamarhat/Widgets/productList.dart';
import '../Widgets/category.dart';
import 'package:stacked_listview/stacked_listview.dart';

const activeColor = Color(0xff6b8e28);
const inactiveColor = Colors.white;

enum selectedCard { catering, restaurant, sweetbakery }

class groceryPage extends StatefulWidget {
  const groceryPage({Key? key}) : super(key: key);

  @override
  State<groceryPage> createState() => _groceryPageState();
}

class _groceryPageState extends State<groceryPage> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    selectedCard selected = selectedCard.catering;

    ScrollController controller = ScrollController();
    bool closeTopController;
    return Scaffold(
      backgroundColor: Color(0xffD3D3D3),
      body: AdvancedDrawer(
        backdropColor: Color(0xff6b8e28),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Mamarhat',
              style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6b8e28),
                  fontSize: size.width * 0.08),
            ),
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                      color: Color(0xff6b8e28),
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                  );
                },
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.04, left: size.width * 0.04),
                child: Text(
                  "Need Something to cook?",
                    style: GoogleFonts.concertOne(
                        fontSize: size.width * 0.04, color: Colors.black38)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height*0.01,left: size.width * 0.04),
                child: Text(
                  "Get Your Groceries", style: GoogleFonts.cabin(
                    fontSize: size.width * 0.06, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 10.0,
                        shadowColor: Colors.blueGrey,
                        child: Container(
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(right: size.width * 0.2),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search Item",
                                    prefixIcon: Icon(Icons.search)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width*0.04),
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      padding: EdgeInsets.all(12.0),
                      fillColor: Color(0xff6b8e28),
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                        size: size.width*0.06,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.04, top: size.height*0.03 ),
                child: Text("Categories",     style: GoogleFonts.play(
                    color: Color(0xff6b8e28),
                    fontSize: size.width * 0.06),),
              ),
              Container(
                height: size.height * 0.15,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    groceryCatCard(image: "images/daal.jpg", name: "Lentils", desc: "Get the best daal"),
                    groceryCatCard(image: "images/cereals.png", name: "Cereals", desc: "Best cereals"),
                    groceryCatCard(image: "images/cereals.png", name: "Cereals", desc: "Best cereals")


                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.03),
                    child: Text(
                      "Popular",
                      style: GoogleFonts.play(
                          color: Color(0xff6b8e28),
                          fontSize: size.width * 0.06),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.45,
                        top: size.height * 0.05),
                    child: Text("See all"),
                  )
                ],
              ),


              Expanded(
                child: ListView(
                  children: [Expanded(
                    child: SizedBox(height: size.height *0.22,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        children: [
                          grocItemsCard(name: "Daal",image: 'images/daalmong.jpg',price:"32 BDT/Kg",ontap: (){
                            itemDetail();
                          },),
                          grocItemsCard(name: "Daal",image: 'images/daalmong.jpg',price:"32 BDT/Kg",)
                        ],


                      ),),
                  ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height*0.03),
                      child: Text("Meat", style: GoogleFonts.roboto(color: Color(0xff6b8e28), fontSize: size.width*0.05),),
                    ),

                    Expanded(
                      child: SizedBox(height: size.height *0.28,
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          children: [
                            meatCard(image: 'images/cow.jpg', name: "Desi cow Meat"),
                            meatCard(image: 'images/goat.png',name: "Desi goat meat",)
                          ],


                        ),),
                    ),


                  ]
                ),
              )
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            color: Color(0xff6b8e28),
            backgroundColor: Colors.white,
            items: [
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(Icons.shopping_cart, size: 30, color: Colors.white),
              Icon(Icons.favorite, size: 30, color: Colors.white),
              Icon(Icons.verified_user,size: 30, color: Colors.white)
            ],
          ),
        ),
        drawer: SafeArea(
          child: Container(
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
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'images/logo.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('My Profile'),
                  ),
                  ListTile(
                    onTap: () {},
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
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

//


class itemDetail extends StatefulWidget {
  const itemDetail({Key? key}) : super(key: key);

  @override
  State<itemDetail> createState() => _itemDetailState();
}

class _itemDetailState extends State<itemDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hellooooooo"),
    );
  }
}
