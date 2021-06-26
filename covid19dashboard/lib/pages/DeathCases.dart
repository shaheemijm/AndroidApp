import 'package:covid19dashboard/APIManager/APICall.dart';
import 'package:covid19dashboard/componants/BkAppbar.dart';
import 'package:covid19dashboard/models/Data.dart';
import 'package:covid19dashboard/models/jsonData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeathCases extends StatefulWidget {

  @override
  _DeathCasesState createState() => _DeathCasesState();
}

class _DeathCasesState extends State<DeathCases> {
   late Future <Welcome> _covidData;
   final formatter = NumberFormat("#,###");
   var dataValue;
   @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _covidData = ApiCall().getData();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_covidData = ApiCall().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child:BkAppbar(),
      ),
    //  backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
        body:Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Center(child: Text("Statistics", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              ),
              Divider(thickness: 5,),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  width: 250,
                  height: 150,
                  color: Colors.red,
                  child:Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("Total deaths", style: TextStyle(color: const Color(0xffFFFFFF),fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                        FutureBuilder <Welcome>(
                            future: _covidData,
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                dataValue = snapshot.data!.data.localDeaths;
                                return Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text(
                                    "${formatter.format(dataValue)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                );
                              } else if(snapshot.hasError){
                                return Center(child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text (
                                    "Error to load!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                )
                                );
                              }
                              else
                                return Center(child: CircularProgressIndicator()
                              );
                            }
                        ),
                      ],
                    ),
                  ) ,
                ),
              ),
              Divider(
                height: 50,
                thickness: 5,
              ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Text("Chart for Total death and global deaths"),
            ),
          )
            ],
          ),
        ),
    );
  }
}
