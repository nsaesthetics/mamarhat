import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class grocItemsCard extends StatefulWidget {
  const grocItemsCard({Key? key,required this.image, required this.name,required this.price, this.ontap}) : super(key: key);

  final String name;
  final String image;
  final String price;
  final ontap;



  @override
  State<grocItemsCard> createState() => _grocItemsCardState();
}

class _grocItemsCardState extends State<grocItemsCard> {
  @override
  Widget build(BuildContext context) {


    final Size size = MediaQuery.of(context).size;
    return
      Padding(
        padding: EdgeInsets.only(left: size.width*0.04),
        child: Bounceable(
          onTap: widget.ontap,
          curve: Curves.easeInCirc,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(15)
            ),
            child: Material(
              color: Colors.white,
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              child: Row(
                  children: [
              ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: Image.asset(widget.image, width: size.width*0.3,),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    widget.name,
                    style: GoogleFonts.roboto(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: size.width*0.25,),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          size: size.width * 0.06,
                          color: Color(0xff6b8e28),
                        ))

                  ],
                ),
                  Text("Delivery 49 mins", style: GoogleFonts.merriweatherSans(
                    color: Colors.grey, fontSize: size.width*0.035
                  ),),

                  Row(
                    children: [
                      Text(widget.price, style: GoogleFonts.roboto(color:Color(0xff6b8e28), fontWeight: FontWeight.w700, fontSize: size.width*0.04),)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height*0.06,
                        width: size.height*0.06,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                offset: Offset(1.0, 1.0), // shadow direction: bottom right
                              )
                            ],
                            color: Colors.lightGreenAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(onPressed: (){},style: IconButton.styleFrom(padding: EdgeInsets.zero), icon: Icon(Icons.add,
                          size: size.width*0.05,)),
                      ),
                      SizedBox(width: size.width*0.02,),
                      Text("2", style: TextStyle(color: Color(0xff6b8e28), fontSize: size.width*0.04),),
                      SizedBox(width: size.width*0.02,),
                      Container(
                        height: size.height*0.06,
                        width: size.height*0.06,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                offset: Offset(1.0, 1.0), // shadow direction: bottom right
                              )
                            ],
                            color: Colors.lightGreenAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(onPressed: (){},style: IconButton.styleFrom(padding: EdgeInsets.zero), icon: Icon(Icons.add,
                          size: size.width*0.05,)),
                      ),
                      SizedBox(width: size.width*0.03,),
                      MaterialButton(onPressed: (){}, child: Text("Add", style: GoogleFonts.roboto(color: Colors.white),), color: Color(0xff6b8e28), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),)

                    ],
                  )

                ],
                ),
              ),
              ]
                  ),
            ),
          ),),
      );
  }
}

class meatCard extends StatelessWidget {
  const meatCard({Key? key,required this.name, required this.image}) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width*0.04),
    child: Material(
      child: Bounceable(
        onTap: (){},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: size.width*0.25,height: size.width*0.2,),
            Text(name, style: GoogleFonts.merriweatherSans(
              fontSize: size.width*0.05,
              fontWeight: FontWeight.w700,
            ),),
            Text("Delivery 10 mins", style: GoogleFonts.merriweatherSans(
              fontSize: size.width*0.03,
              color: Colors.grey
            ),),
            SizedBox(height: size.height*0.02,),
            MaterialButton(onPressed: (){}, color: Color(0xff6b8e28), shape: RoundedRectangleBorder(borderRadius: 
            BorderRadius.circular(10)),child: Text("View More",
              style: TextStyle(color: Colors.white),) ,),
          ],
        ),
      ),
    ),
    );
  }
}
