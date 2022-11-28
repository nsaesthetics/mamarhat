import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mamarhat/Widgets/pharmacyCard.dart';


class pharmacyDetails extends StatefulWidget {
  const pharmacyDetails({Key? key}) : super(key: key);

  @override
  State<pharmacyDetails> createState() => _pharmacyDetailsState();
}

class _pharmacyDetailsState extends State<pharmacyDetails> {
  File? Image;
  Future pickImage() async {
    try{

        final Image =await ImagePicker().pickImage(source: ImageSource.gallery);
    if(Image == null) return;
    final imageTemp = File(Image.path);
    setState(() {
      this.Image = imageTemp;
    });
  } on PlatformException catch (e){
      print("Failed to pick image: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined),color: Colors.black, onPressed: (){Navigator.pop(context);},),
        title: Text("Submit Prescription", style: GoogleFonts.merriweatherSans(
          fontSize: size.width*0.045,
          color: Colors.black
        ),),
      ),
      body: Column(
          children:[
            pharmacyCard(pharmImage: "images/pharmacy.jpg", pharmName: 'AED Pharmacy'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: size.width*0.4,
                    child: ListTile(
                      tileColor: Color(0xff6b8e28).withOpacity(0.5),
                      leading: Icon(Icons.camera),
                      title: Text("Take Photo"),
                        minVerticalPadding: -5,
                        minLeadingWidth: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        visualDensity: VisualDensity(horizontal: -3,vertical: -4)
                    ),
                  ),
                  SizedBox(
                    width: size.width*0.4,
                    child: ListTile(
                      onTap: ()=> pickImage(),
                      tileColor: Color(0xff6b8e28).withOpacity(0.5),
                      leading: Icon(Icons.browse_gallery),
                      title: Text("Upload"),
                      minLeadingWidth: 10,
                      visualDensity: VisualDensity(horizontal: -3,vertical: -4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),

                ],
              ),
            ),
      ]),
    );
  }
}
