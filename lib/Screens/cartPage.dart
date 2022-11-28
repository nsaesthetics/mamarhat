import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';


class cartPage extends StatefulWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart", style: GoogleFonts.merriweatherSans(fontWeight: FontWeight.w700, color: Colors.black),),
        backgroundColor: Colors.transparent,elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Color(0xff6b8e28),),onPressed: (){},),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            cartItem(size: size),
            cartItem(size: size),
            cartItem(size: size),
            Padding(
              padding: EdgeInsets.symmetric(vertical:size.height*0.01,horizontal: size.width*0.25),
              child: Bounceable(onTap: (){}, child: MaterialButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:  EdgeInsets.all(size.width*0.03),
                    child: Text("Add More Items", style: GoogleFonts.roboto(fontSize: size.width*0.05,color: Color(0xff6b8e28)),),
                  ),
                color: Colors.lightGreenAccent.withOpacity(0.6),
              )),
            ),

            Material(
              color: Color(0xff6b8e28).withOpacity(0.2),
              child: Padding(
                padding:EdgeInsets.symmetric(horizontal: size.width*0.04,vertical:size.width*0.025),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sub Total", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.05, fontWeight: FontWeight.w700),),
                          Text("830 Bdt", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.05, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Charge", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.045,color: Colors.grey),),
                          Text("40 BDT", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.045, color: Colors.grey))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:size.width*0.02, vertical: size.width*0.02),
                      child: Divider(
                      thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.045,color: Color(0xff6b8e28)),),
                          Text("870 BDT", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.045, color: Color(0xff6b8e28), fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.04,vertical:size.width*0.025),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment Method', style: GoogleFonts.merriweatherSans(fontWeight: FontWeight.w700, fontSize: size.width*0.05),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   Expanded(
                     child: ListTile(minLeadingWidth: 10,contentPadding: EdgeInsets.zero,minVerticalPadding: 1,leading: Icon(Icons.credit_card_outlined,size: size.width*0.09,color: Colors.black,),
                     title: Text("Pay with credit/debit card", style: GoogleFonts.merriweatherSans(color: Colors.grey, fontSize: size.width*0.04),),),
                   ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListTile(minLeadingWidth: 10,contentPadding: EdgeInsets.zero,minVerticalPadding: 1,leading: Icon(Icons.credit_card,size: size.width*0.09,color: Colors.black,),
                          title: Text("Pay with Bcash", style: GoogleFonts.merriweatherSans(color: Colors.grey, fontSize: size.width*0.04),),),
                      )
                    ],
                  )
                ],
              ),
            )

          ],

        ),
      ),
    );
  }
}

class cartItem extends StatelessWidget {
  const cartItem({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.01),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          width: size.width*0.9,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.width*0.01, horizontal:size.width*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/gas.jpg', width: size.width*0.25,)),
                Padding(
                  padding: EdgeInsets.only(left: size.width*0.02,top: size.height*0.008),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Puti Dry Fish", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.045, fontWeight: FontWeight.w300),),
                      Text("BDT 50/kg", style: GoogleFonts.play(color: Colors.grey, fontSize: size.width*0.038),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

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
                            height: size.height*0.06,
                            width: size.height*0.06,
                            child: IconButton(onPressed: (){},style: IconButton.styleFrom(padding: EdgeInsets.zero), icon: Icon(Icons.add,
                              size: size.width*0.05,)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.01),
                            child: Text('2',style: TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.w700),),
                          ),
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
                          Padding(
                            padding: EdgeInsets.only(left:size.width*0.15,),
                            child: Text("300 BDT",style: GoogleFonts.merriweatherSans(fontWeight: FontWeight.w600, fontSize: size.width*0.04, color: Color(0xff6b8e28)),),
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
