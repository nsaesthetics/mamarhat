import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mamarhat/Widgets/foodItemsCard.dart';
import 'package:mamarhat/Widgets/productList.dart';
import '../Widgets/category.dart';
import 'package:stacked_listview/stacked_listview.dart';
import 'package:flutter_svg/flutter_svg.dart';

const activeColor = Color(0xff6b8e28);
const inactiveColor = Colors.white;

enum selectedCard {restaurant, catering,  sweetbakery }

class foodPage extends StatefulWidget {
  const foodPage({Key? key}) : super(key: key);

  @override
  State<foodPage> createState() => _foodPageState();
}

class _foodPageState extends State<foodPage> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    selectedCard selected = selectedCard.catering;

    ScrollController controller = ScrollController();
    bool closeTopController;
    return Scaffold(
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
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.04, left: size.width * 0.04),
                child: Text(
                  "Hey Name",
                  style: GoogleFonts.cabin(
                      fontSize: size.width * 0.07, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.04),
                child: Text(
                  "Let's find quality products",
                  style: GoogleFonts.concertOne(
                      fontSize: size.width * 0.05, color: Colors.black38),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryCard(
                      onPressed: () {
                        Navigator.pushNamed(context, '/restaurant');
                        setState(() {
                          selected == selectedCard.restaurant;
                        });
                      },
                      color: selected == selectedCard.restaurant
                          ? activeColor
                          : inactiveColor,
                      iconImage:'images/restaurant.svg', name: "Restaurant"),
                  categoryCard(
                      onPressed: () {
                        setState(() {
                          selected == selectedCard.catering;
                        });
                      },
                      color: selected == selectedCard.catering
                          ? activeColor
                          : inactiveColor,
                      iconImage: 'images/restaurant.svg',
                      name: "Catering"),
                  categoryCard(
                      onPressed: () {
                        setState(() {
                        selected == selectedCard.sweetbakery;
                      });
                      },
                      color: selected == selectedCard.sweetbakery
                          ? activeColor
                          : inactiveColor,
                      iconImage:'images/restaurant.svg',
                      name: "Bakery"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.04,),
                    child: Text(
                      "Offer food",
                      style: GoogleFonts.merriweather(
                          color: Color(0xff6b8e28),
                          fontSize: size.width * 0.06),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.04,),
                    child: Text("See all" ,style: GoogleFonts.roboto()),
                  )
                ],
              ),

              SizedBox(
                height: size.height*0.5,
                width: size.width,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),

                  foodItemCard(name: "KFC",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png',desc:"Fast Food Restaurant",),
                ],


              ),)
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
                      'images/logo.svg'
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
