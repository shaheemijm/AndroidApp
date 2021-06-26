// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<String> imagelist = [
      'images/covid2.jpg',
      'images/covid3.jpg',
      'images/covid4.jpg',
      'images/covid5.jpg',
      'images/covid6.jpg'
    ];
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
            autoPlayCurve:Curves.fastOutSlowIn,
            autoPlayAnimationDuration: Duration(microseconds: 1000),
             scrollDirection: Axis.horizontal,


        // dotSize: 4.0,
      // indicatorBgPadding: 2,
      // dotColor: Colors.blue,
    ),
      items: imagelist.map((item) => Container(
        child: Center(
            child: Image.asset(item, fit: BoxFit.cover,)
        ),
      )).toList(),


    //   ], AssetImage('images/covid1.jpg'),
    // AssetImage('images/covid2.jpg'),
    // AssetImage('images/covid3.jpg'),
    // AssetImage('images/covid4.jpg'),
    // AssetImage('images/covid5.jpg'),
    // AssetImage('images/covid6.jpg'),
      //     autoplay: true,
      //     animationCurve: Curves.fastOutSlowIn,
      //     animationDuration: Duration(microseconds: 1000),
      // dotSize: 4.0,
      // indicatorBgPadding: 2,
      // dotColor: Colors.blue,
    );
  }


}
