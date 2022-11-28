import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamarhat/Widgets/forSaleSwiper.dart';
import 'package:mamarhat/Widgets/pharmacyCard.dart';


enum selectedPharm{
  allo, homeo, ayur
}


const activeColor = Color(0xff6b8e28);
const inactiveColor = Colors.white;
class medicinePage extends StatefulWidget {
  const medicinePage({Key? key}) : super(key: key);

  @override
  State<medicinePage> createState() => _medicinePageState();
}

class _medicinePageState extends State<medicinePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    selectedPharm selectpharm = selectedPharm.allo;
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              offersSwiper(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        selectpharm = selectedPharm.allo;
                      });
                    },

                    style: ElevatedButton.styleFrom(elevation: 0.0,
                        backgroundColor: selectpharm == selectedPharm.allo? activeColor:inactiveColor
                    ),
                    child:(Text("Allopathic",style: GoogleFonts.merriweatherSans(
                        color: selectpharm == selectedPharm.allo? Colors.white:Colors.black
                    ),)) ,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {

                        selectpharm = selectedPharm.homeo;

                      });
                    },
                    style: ElevatedButton.styleFrom(elevation: 0.0,
                        backgroundColor: selectpharm == selectedPharm.homeo? activeColor:inactiveColor
                    ),
                    child:(Text("Homeopathic",style: GoogleFonts.merriweatherSans(
                        color: selectpharm == selectedPharm.ayur? Colors.white:Colors.black
                    ))) ,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        selectpharm = selectedPharm.ayur;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: selectpharm == selectedPharm.ayur? activeColor:inactiveColor
                    ),
                    child:(Text("Ayurvedic", style: GoogleFonts.merriweatherSans(
                        color: selectpharm == selectedPharm.ayur? Colors.white:Colors.black
                    ),)) ,
                  ),
                ],
              ),
              SizedBox(
                height: size.width*0.05,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    pharmacyCard(ontap: (){
                      Navigator.pushNamed(context, '/pharmadetails');
                    },pharmName: "AED PHARMACY",pharmImage: "images/pharmacy.jpg",),
                    pharmacyCard(ontap: (){},
                    pharmImage: "images/pharmacy.jpg",
                    pharmName: "AED PHARMACY",)
                  ],

                ),
              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            color: Color(0xff6b8e28),
            backgroundColor: Colors.transparent,
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

