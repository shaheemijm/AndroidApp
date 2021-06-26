
// ignore: import_of_legacy_library_into_null_safe
import 'package:clip_shadow/clip_shadow.dart' show ClipShadow;
import 'package:flutter/material.dart';

import 'CustomAppbar.dart';

class Appbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
          clipper: CustomAppbar(),
          child:Container(
            color: Theme.of(context).backgroundColor,
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
