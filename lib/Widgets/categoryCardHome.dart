import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';


class categoryCardHome extends StatefulWidget {
  const categoryCardHome({Key? key, required this.name, required this.IconImage, required this.onPressed}) : super(key: key);

  final onPressed;
  final String name;
  final String IconImage;

  @override
  State<categoryCardHome> createState() => _categoryCardHomeState();
}

class _categoryCardHomeState extends State<categoryCardHome> {
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Bounceable(
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
        width: MediaQuery.of(context).size.width *0.30,
        child: Padding(
          padding: EdgeInsets.all(size.width*0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(widget.IconImage,color:Color(0xff6b8e28) , width: size.width*0.08,height: size.height*0.08,),
              SizedBox(height: size.height*0.02,),
              Text(widget.name, style: TextStyle(color:Color(0xff6b8e28),fontSize: MediaQuery.of(context).size.width *0.04),)
            ],
          ),
        ),
      ),
    );
  }
}
