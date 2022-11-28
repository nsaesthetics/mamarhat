import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';


class categoryCard extends StatefulWidget {
  const categoryCard({Key? key,required this.color, required this.name, required this.iconImage, this.onPressed}) : super(key: key);

  final onPressed;
  final String name;
  final String iconImage;
  final Color color;


  @override
  State<categoryCard> createState() => _categoryCardState();
}

class _categoryCardState extends State<categoryCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height*0.03),
      child: Bounceable(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 5
              ),],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color(0xff6b8e28),
                  width: 2
              )
          ),
          width: MediaQuery.of(context).size.width *0.24,
          child: Padding(
            padding: EdgeInsets.all(size.width*0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(widget.iconImage,color:Color(0xff6b8e28) , width: size.width*0.06,height: size.height*0.06,),
                SizedBox(height: size.height*0.02,),
                Text(widget.name, style: TextStyle(color:Color(0xff6b8e28),fontSize: MediaQuery.of(context).size.width *0.03),)
              ],
            ),
          ),
        ),
      )
    );
  }
}

