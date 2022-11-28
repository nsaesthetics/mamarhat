import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class productList extends StatelessWidget {
  const productList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height*0.03,horizontal: size.width *0.07),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),

        width: size.width*0.95,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("KFC",
                style: GoogleFonts.notoSans(
                  fontSize: size.width *0.06,
                  fontWeight: FontWeight.bold
                ),),
                Text("Fast-food Restaurant",
                  style: GoogleFonts.notoSans(
                      fontSize: size.width *0.04,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  ),),
              ],
            )
          ],
        ),
      ),
    ) ;
  }
}
