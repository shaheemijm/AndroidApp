import 'package:covid19dashboard/componants/Summary.dart';
import 'package:covid19dashboard/pages/ActiveCase.dart';
import 'package:covid19dashboard/pages/DeathCases.dart';
import 'package:covid19dashboard/pages/Recoverinfo.dart';
import 'package:covid19dashboard/pages/TotalCases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data_Chart.dart';

class HorizontalList extends StatelessWidget {

  final catogaryList =[
  {
      "imageIcon":'icons/activecase.png',
      "textTitle":'Active Cases',
          "Key" :1

    },
    {
      "imageIcon":'icons/totalcase.png',
      "textTitle":"Total Cases",
      "Key":2

    },

    {
      "imageIcon":'icons/recover.png',
      "textTitle":"Total Recovery",
      "Key":3

    },
    {
      "imageIcon": 'icons/death.png',
      "textTitle": 'Death Info',
      "Key":4

    },
    {
      "imageIcon":'icons/dailycase-icon.png',

      "textTitle":"HospitalWiseDetails",
      "Key":5
    },

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catogaryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        //indexId = index;
        return category (
          imageIcon:catogaryList[index]['imageIcon'],
          textTitle: catogaryList[index]['textTitle'],
          Identity: catogaryList[index]['Key'],
        );
      },
    );
  }
}
// ignore: camel_case_types
class category extends StatefulWidget {
   final imageIcon;
   final textTitle;
   final Identity;

  const category({required this.imageIcon, required this.textTitle, this.Identity,});

  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.only(top: 3,left: 3,right: 3,bottom: 1),
        child: InkWell(
          onTap: ()=> {
          if(widget.Identity ==1){
    Navigator.of(context).push(
    new MaterialPageRoute(builder:
    (context) => new ActiveCase(),
    )
    ),
    } else if(widget.Identity==2){
            Navigator.of(context).push(
                new MaterialPageRoute(builder:
                    (context) => new TotalCases(),
                )
            ),
          } else if(widget.Identity==3){
            Navigator.of(context).push(
                new MaterialPageRoute(builder:
                    (context) => new Recoverinfo(),
                )
            ),
          }
          else if(widget.Identity==4){
              Navigator.of(context).push(
                  new MaterialPageRoute(builder:
                      (context) => new DeathCases(),
                  )
              ),
            }
            else if(widget.Identity==5){
                Navigator.of(context).push(
                    new MaterialPageRoute(builder:
                        (context) => new Chart(),
                    )
                ),
              }
  },
          child: Container(
            width: 100.0,
            child: ListTile(
              title: Image.asset(
                  widget.imageIcon,
                  width: 100.0,
                  height: 80,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5,left: 15),
                  child: Text(
                      widget.textTitle,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

            ),

          ),
        ),
    );

  }
}



