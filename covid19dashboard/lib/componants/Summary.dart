import 'package:covid19dashboard/APIManager/APICall.dart';
import 'package:covid19dashboard/models/chartData.dart';
import 'package:covid19dashboard/models/jsonData.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


import 'BkAppbar.dart';

class Summary extends StatefulWidget {

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  // ignore: non_constant_identifier_names
  late List <charts.Series<Pollution,String>> ?_SeriesBarData;
  // ignore: non_constant_identifier_names
  late List <charts.Series<Tasks,String>> ?_SeriesData;

  late Future <Welcome> _covidData;

  _generateData() {
    var pieData = [

      Tasks("work", 20, Color(0xffc7a00c)),
      Tasks("Eat", 20, Color(0xff4d2eb3)),
      Tasks("drink", 25.0,Color(0xffdc39a7)),
      Tasks("walk", 15, Color(0xffa10636)),
      Tasks("run", 20, Color(0xff27bd0f)),
    ];
    var barData = [
      Pollution("USA",1980,30),
      Pollution("Asia",1980,60),
      Pollution("EU",1980,55),
    ];
    var barData1 = [
      Pollution("USA",1990,40),
      Pollution("Asia",1990,150),
      Pollution("EU",1995,60),
    ];
    var barData2 = [
      Pollution("USA",1985,80),
      Pollution("Asia",1992,120),
      Pollution("EU",2000,110),
    ];
    // this is pie chart data adding.......
    _SeriesData!.add(
      charts.Series(
        data:pieData,
          domainFn:(Tasks tasks,_) =>tasks.task,
          measureFn: (Tasks tasks,_)=>tasks.taskValue,
          colorFn: (Tasks tasks,_)=> charts.ColorUtil.fromDartColor(tasks.colorValue),
          id: "DailyTask",
        labelAccessorFn: (Tasks row,_)=>"${row.taskValue}",
      )
    );

    //Here this is Bar chart Data Adding....
    _SeriesBarData!.add(
      charts.Series(
        data: barData,
        domainFn:(Pollution pollution,_) => pollution.place,
        measureFn: (Pollution pollution,_)=> pollution.quantity,
        id: "2017",
        fillPatternFn: (_,__)=> charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution,_) => charts.ColorUtil.fromDartColor(Color(0xffc7a00c))
      )
    );
    // 2nd Data series...
    _SeriesBarData!.add(
        charts.Series(
            data: barData1,
            domainFn:(Pollution pollution,_) => pollution.place,
            measureFn: (Pollution pollution,_)=> pollution.quantity,
            id: "2018",
            fillPatternFn: (_,__)=> charts.FillPatternType.solid,
            fillColorFn: (Pollution pollution,_) => charts.ColorUtil.fromDartColor(Color(0xff4d2eb3))
        )
    );
    //3rd Data Series.....
    _SeriesBarData!.add(
        charts.Series(
            data: barData2,
            domainFn:(Pollution pollution,_) => pollution.place,
            measureFn: (Pollution pollution,_)=> pollution.quantity,
            id: "209",
            fillPatternFn: (_,__)=> charts.FillPatternType.solid,
            fillColorFn: (Pollution pollution,_) => charts.ColorUtil.fromDartColor(Color(0xffdc39a7))
        )
    );

  }

  @override
  void initState() {
    _SeriesData =  <charts.Series<Tasks,String>>[];
    _SeriesBarData = <charts.Series<Pollution,String>>[];
    _covidData = ApiCall().getData();
    // TODO: implement initState
    super.initState();
    _generateData();
    //var response = ApiCall().getData();
  }


  @override
  // ignore: must_call_super
  void didChangeDependencies() {
    _SeriesData =  <charts.Series<Tasks,String>>[];
    _SeriesBarData = <charts.Series<Pollution,String>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
    child:BkAppbar(),
    ),
       body: Container(
          color: Colors.white,
                      //color: Colors.grey,
         child: Column(
           children: [
             Expanded(
               child: charts.PieChart(
                 _SeriesData,
                 animate: true,
                 animationDuration: Duration(seconds: 5),
                 defaultRenderer: charts.ArcRendererConfig(
                     arcWidth: 100,
                     arcRendererDecorators: [
                       charts.ArcLabelDecorator(
                         labelPosition: charts.ArcLabelPosition.auto,
                       )
                     ]
                 ) ,

               ),
             ),
             Expanded(
                 child: charts.BarChart(
                     _SeriesBarData,
                   animate: true,
                   barGroupingType: charts.BarGroupingType.grouped,
                   animationDuration: Duration(seconds: 5),
                 ),
             ),
           ],

         ),

                        //Image.asset('images/covid2.jpg'),
                     
                 




            // StaggeredGridView.count(
            //   crossAxisCount: 4,
            //   crossAxisSpacing: 5.0,
            //   mainAxisSpacing: 5.0,
            //     staggeredTiles: [
            //       StaggeredTile.count(4,6),
            //       // StaggeredTile.count(2,2),
            //       // StaggeredTile.count(4,4),
            //     ],
            //   children: [
            //     Expanded(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.blueAccent),
            //            boxShadow: [BoxShadow(blurRadius: 10,offset: Offset(1,3))]
            //         ),
            //         child: Center(
            //           child: Padding(padding: EdgeInsets.all(2),
            //           child: Column(
            //               children: [
            //                 Container(
            //                   child: Text("Monthly Revenue",style: TextStyle(backgroundColor: Colors.red),
            //                   ),
            //                 ),
            //                 Container(
            //                   child: Text("Monthly Revenue",style: TextStyle(backgroundColor: Colors.red),
            //                   ),
            //                 ),
            //
            //               ],),
            //
            //           ),
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // )
        ),

    );
  }
}
