import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class offersSwiper extends StatelessWidget {
  const offersSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 200.0,
            child: Swiper(

              itemBuilder: (BuildContext context,int index){
                return Image( image: AssetImage("images/ramadan.jpg",));
              },
              itemCount: 3,
              loop: true,
              viewportFraction: 0.8,
              scale: 0.9,
              autoplayDelay: 400,
              pagination: SwiperPagination(margin: EdgeInsets.only(top: 15.0)),
            ),
          ),
        ),

      ],
    );
  }
}
