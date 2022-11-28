import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mamarhat/Widgets/topRatedCard.dart';

class restaurantDetail extends StatefulWidget {
  const restaurantDetail({Key? key}) : super(key: key);

  @override
  State<restaurantDetail> createState() => _restaurantDetailState();
}

class _restaurantDetailState extends State<restaurantDetail> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.all(size.width*0.1),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: Image.asset('images/hotel.jpg',),
            ),
          ),
        Expanded(
          child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical:size.height*0.01, horizontal: size.width*0.03),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Topview Restaurant", style: GoogleFonts.merriweatherSans(fontSize: size.width*0.05, fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,size: size.width*0.08, color: Color(0xff6b8e28),))
                    ],
                  ),

                  Text("Description"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height*0.1,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(onPressed:(){},alignment: Alignment.centerLeft,icon:Icon(Icons.star,color: Color(0xff191970),size: size.width*0.05,)),
                                  Text('4.6', style: TextStyle(color: Color(0xff191970), fontSize: size.width*0.05),)
                                ],
                              ),
                            ),
                            Text("Delivered in 10 mins", style: GoogleFonts.play(),)
                          ],
                        ),
                      ),
                      MaterialButton(onPressed: (){},color: Color(0xff6b8e28),shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: size.width*0.01,horizontal: size.height*0.04),
                        child: Text("Visit", style: GoogleFonts.roboto(color:Colors.white, fontSize: size.width*0.06,fontWeight: FontWeight.bold),),
                      ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height*0.03),
                    child: Text("Top Rated", style: GoogleFonts.merriweatherSans(color: Color(0xff6b8e28), fontSize: size.width*0.05,fontWeight: FontWeight.w700),),
                  ),
                  topRatedCard()


                ],

              ),
            ),
          ),
        )
        ],
      )
    );
  }
}
