import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class groceryCatCard extends StatefulWidget {
  const groceryCatCard({Key? key,required this.image, required this.name,required this.desc}) : super(key: key);

  final String name;
  final String image;
  final String desc;



  @override
  State<groceryCatCard> createState() => _groceryCatCardState();
}

class _groceryCatCardState extends State<groceryCatCard> {
  @override
  Widget build(BuildContext context) {


    final Size size = MediaQuery.of(context).size;
    return
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.03,
              horizontal: size.width * 0.05),
          child: Bounceable(
            onTap: (){},
            curve: Curves.easeInCirc,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xff6b8e28),
                    width: 5.0,
                  )

              ),

              width: size.width * 0.5,
              height: size.height *0.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.notoSans(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.desc,
                          style: GoogleFonts.notoSans(
                              fontSize: size.width * 0.03,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Material(

                      child: Image.asset(widget.image,
                        width: size.width*0.1,
                        height: size.height*0.1,),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
