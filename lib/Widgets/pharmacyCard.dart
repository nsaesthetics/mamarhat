import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class pharmacyCard extends StatefulWidget {
  const pharmacyCard({Key? key, this.ontap,required this.pharmImage,required this.pharmName}) : super(key: key);

  final ontap;
  final String pharmImage;
  final String pharmName;

  @override
  State<pharmacyCard> createState() => _pharmacyCardState();
}

class _pharmacyCardState extends State<pharmacyCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Bounceable(
      onTap: widget.ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Image.asset(widget.pharmImage)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pharmName,
                  style: GoogleFonts.concertOne(
                      fontSize: size.width * 0.07, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: size.width * 0.09,
                      color: Color(0xff6b8e28),
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: Color(0xff6b8e28),
                  size: size.width * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.only(left:size.width *0.02),
                  child: Text(
                    "Open",
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.05, color: Color(0xff6b8e28)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text("Delivery in 60 mins"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    leading: Icon(
                      Icons.star,
                      color: Color(0xff191970),
                      size: size.width * 0.07,
                    ),
                    minLeadingWidth: 10.0,
                    title: Text(
                      "4.6",
                      style: GoogleFonts.lato(
                          color: Color(0xff191970), fontSize: size.width * 0.05),
                    ),
                  ),
                ),
                Material(
                    borderRadius: BorderRadius.circular(10.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6b8e28)),
                      child: Text(
                        "Order",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: size.width*0.05
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
