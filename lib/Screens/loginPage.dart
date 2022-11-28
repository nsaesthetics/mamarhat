import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';


class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width *0.3,
            height: MediaQuery.of(context).size.height *0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('images/logo.svg'),
          ),


          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

          Text("Welcome To Mamarhat!",
          style: GoogleFonts.concertOne(
          fontWeight: FontWeight.bold,
          color: Color(0xff6b8e28),
          fontSize: MediaQuery.of(context).size.width * 0.08
          ),),


          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height:MediaQuery.of(context).size.width * 0.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xff6b8e28)
            ),
            child: Bounceable(
              onTap: (){
                Navigator.pushNamed(context, '/home');
              },
              child: Center(child: Text("Login",
                style: GoogleFonts.play(color: Colors.white,
                    fontSize: 22),)),
            )

            ,
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height:MediaQuery.of(context).size.width * 0.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.transparent,
                border: Border.all(
                    width: 2.0,
                    color: Color(0xff6b8e28)
                )),
            child: Bounceable(
              onTap: (){
                Navigator.pushNamed(context, '/cart');
              },
              child: Center(child: Text("Sign Up",
                style: GoogleFonts.play(
                    color: Color(0xff6b8e28),
                    fontSize: 22),)),
            )

            ,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height:MediaQuery.of(context).size.width * 0.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              color: Colors.transparent,
              border: Border.all(
                width: 2.0,
                  color: Color(0xff6b8e28)
              )
            ),
            child: Bounceable(
              onTap: (){
                Navigator.pushNamed(context, '/home');
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('images/facebook.svg',color:Color(0xff6b8e28),width: MediaQuery.of(context).size.width*0.05,),
                  Text("Sign in with facebook",
                  style: GoogleFonts.play(color: Color(0xff6b8e28),
                  fontSize: 22),),
                ],
              ),
            )

            ,
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height:MediaQuery.of(context).size.width * 0.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.transparent,
                border: Border.all(
                    width: 2.0,
                    color: Color(0xff6b8e28)
                )
            ),
            child: Bounceable(
              onTap: (){
                Navigator.pushNamed(context, '/home');
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('images/googleicon.svg',color: Color(0xff6b8e28),width: MediaQuery.of(context).size.width*0.05,),
                  Text("Sign in with Google",
                    style: GoogleFonts.play(color: Color(0xff6b8e28),
                        fontSize: 22),),
                ],
              ),
            )

            ,
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.07,),


          Text("Forgot Passwork?",
          style: GoogleFonts.play(
            decoration: TextDecoration.underline,
            fontSize: 20,
              color: Color(0xff6b8e28)
          ),),

        ],
      ),
    );
  }
}
