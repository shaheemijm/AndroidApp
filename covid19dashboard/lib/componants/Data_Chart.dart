import 'package:covid19dashboard/APIManager/APICall.dart';
import 'package:covid19dashboard/models/Piedata.dart';
import 'package:covid19dashboard/models/jsonData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

import 'BkAppbar.dart';

class Chart extends StatefulWidget {


  @override
  _ChartState createState() => _ChartState();
}
class _ChartState extends State<Chart> {
  late Future <Welcome> _covidData;
  // ignore: non_constant_identifier_names
  late List <charts.Series <Piedata,String>> ?_SeriesBarData;
  @override

  void didChangeDependencies() {
    super.didChangeDependencies();
    _covidData = ApiCall().getData();
    _SeriesBarData = <charts.Series<Piedata,String>>[];
  }
  @override
  void initState() {
    super.initState();
    _covidData = ApiCall().getData();
    _SeriesBarData = <charts.Series<Piedata,String>>[];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child:BkAppbar(),
      ),
      body: Container(
        child: StaggeredGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
           staggeredTiles: [
             StaggeredTile.count(4,6),
             //StaggeredTile.count(4,6),
           ],
            children: [
             Expanded(
                child: Container(
                  child: FutureBuilder<Welcome>(
                    future:_covidData ,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        var snapData = [
                         Piedata(lable: "RecoverInfo", recoverValue: snapshot.data!.data.localRecovered,),
                          Piedata(lable:"TotalDeaths", recoverValue: snapshot.data!.data.localDeaths),
                          Piedata(lable:"TotalCases",recoverValue:snapshot.data!.data.localTotalCases ),
                        ];
                        _SeriesBarData!.add(
                            charts.Series(
                              data: snapData,
                              domainFn:(Piedata piedata,_)=>piedata.lable,
                              measureFn: (Piedata piedata,_)=> piedata.recoverValue,
                              id: "covidData",
                              colorFn:(Piedata piedata,_)=> charts.ColorUtil.fromDartColor(Color(0xffdc39a7)),
                              labelAccessorFn: (Piedata row,_)=>"${row.recoverValue}",
                            )
                        );
                        return Container(
                          child: charts.PieChart(
                              _SeriesBarData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            defaultRenderer: charts.ArcRendererConfig(
                              arcWidth: 100,
                              arcRendererDecorators: [
                                charts.ArcLabelDecorator(
                                  labelPosition: charts.ArcLabelPosition.inside
                                )
                              ]
                            ),
                          ),
                        );
                      } else if(snapshot.hasError){
                        return Padding(padding: EdgeInsets.all(10),
                          child: Text(
                            "Error to load Data",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: const Color(0xffe70e0e),
                            ),
                          ),
                        );
                      }
                      else{
                        return Center(child: CircularProgressIndicator()
                        );
                      }
                         }
                ),
              )
              ),
            ],

        ),

        ),
    );
  }


}
