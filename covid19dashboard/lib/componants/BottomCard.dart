import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          width: double.infinity,
          child: Image.asset('images/banner.png'),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
            color: Colors.white,
      ),
      ),
     
    );
  }
}
