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
    return Container(
      width: size.width * 0.4,
      margin: EdgeInsets.all(8),
      child: Bounceable(
          onTap: () {},
          curve: Curves.easeInCirc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset("images/grocery.jpg",fit: BoxFit.fitHeight,)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff6b8e28),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "50% off",
                      style: GoogleFonts.merriweather(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: size.width * 0.04),
                    ),
                  ),
                ],
              ),
              Text(
                "Panir Curry",
                style: GoogleFonts.merriweather(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Delivery in 10 mins",
                style: TextStyle(fontSize: size.width * 0.03),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("BDT 200"),
                  GestureDetector(
                    child: Text(
                      "Add Cart",
                      style: GoogleFonts.merriweatherSans(
                          color: const Color(0xff6b8e28)),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
