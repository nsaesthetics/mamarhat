import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'dart:ui';

class foodItemCard extends StatefulWidget {
  const foodItemCard(
      {Key? key, required this.image, required this.name, required this.desc})
      : super(key: key);

  final String name;
  final String image;
  final String desc;

  @override
  State<foodItemCard> createState() => _foodItemCardState();
}

class _foodItemCardState extends State<foodItemCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03, horizontal: size.width * 0.04),
            child: Bounceable(
                onTap: () {},
                curve: Curves.easeInCirc,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage("images/grocery.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                            width: size.width * 0.40,
                            height: size.height * 0.20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff6b8e28),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "50% off",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: size.width * 0.04),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.1,)
                    ,Text("Panir Curry", style: GoogleFonts.merriweather(fontSize: size.width*0.05,fontWeight: FontWeight.w700),),
                    Text("Delivery in 10 mins", style: TextStyle(fontSize: size.width*0.03),),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("BDT 200"),
                          GestureDetector(
                            child: Text("Add Cart", style: GoogleFonts.merriweatherSans(color: Color(0xff6b8e28)),),
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
