import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class topRatedCard extends StatelessWidget {
  const topRatedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        ClipRRect(
          child: Image.asset('images/hotel.jpg', width: size.width*0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pine Curry HOTEL", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: size.width*0.04),),
            FittedBox(
                child: Text("Description of item is following")),
            Row(

            )
          ],
        )
      ],
    );
  }
}
