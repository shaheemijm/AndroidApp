// ignore: import_of_legacy_library_into_null_safe
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';

import 'CustomAppbar.dart';

class BkAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: CustomAppbar(),
      child:Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap:() => Navigator.pop(context, false),
                        child: Icon(
                            Icons.arrow_back,
                          color: Colors.white,
                ),
                      ),
                    ),



            ],
          ),
        ),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.0,0.0),
          blurRadius: 10.0,
          spreadRadius: 10.0,
          color: Color.fromRGBO(196, 196, 196, 1),
        )

      ],
    );
  }
}
