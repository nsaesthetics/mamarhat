import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width *0.3,
              height: MediaQuery.of(context).size.height *0.2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage("https://thumbs.dreamstime.com/z/silhouette-man-s-head-hipster-glasses-irish-clover-green-avatar-leaf-st-patrick-eco-friendly-isolated-white-212963980.jpg"),
                      fit: BoxFit.fill
                  )
              ),
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

            Text("Welcome To Mamarhat!",
              style: GoogleFonts.lora(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.07
              ),),


            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

            Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.1)
              ,child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff6b8e28).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)

                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email"
                    ),
                  ),
                ),
              ),),


            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

            Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.1)
              ,child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff6b8e28).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)

                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password"
                    ),
                  ),
                ),
              ),),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height:MediaQuery.of(context).size.width * 0.11,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color(0xff6b8e28)
              ),
              child: GestureDetector(
                onTap: (){},
                child: Center(child: Text("Login",
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),)),
              )

              ,
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",),
                GestureDetector(
                  onTap: (){
                  },
                  child: Text("Register Now!",
                    style: TextStyle(
                        color: Color(0xff6b8e28),
                        fontWeight: FontWeight.bold
                    ),),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
