import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

class homeMenu extends StatefulWidget {
  const homeMenu({Key? key,required this.imageURL, this.ontap, required this.menuName}) : super(key: key);

  final String menuName;
  final ontap;
  final String imageURL;

  @override
  State<homeMenu> createState() => _homeMenuState();
}

class _homeMenuState extends State<homeMenu> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:size.width*0.03),
        child: Bounceable(
          onTap: widget.ontap,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(17.0),
    image: DecorationImage(
    image: AssetImage(widget.imageURL),
    fit: BoxFit.cover,
    ),),
                alignment: Alignment.bottomCenter,
                width: size.width*0.25,
                height: size.height*0.25,
                child: Text(widget.menuName,
                  style: GoogleFonts.merriweather(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: size.width*0.05
                  ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
// homeMenu(menuName: "OrderFood", ontap: (){
// Navigator.pushNamed(context, '/food');
// },)