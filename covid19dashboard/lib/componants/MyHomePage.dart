import 'package:covid19dashboard/componants/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'Appbar.dart';
import 'BottomCard.dart';
import 'HorizontalList.dart';
import 'ImageSlider.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child:Appbar(),
        ),
        //AppBar(
      //
      //   elevation: 0.1,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text("Covid19 Dashboard"),
      //   actions: [
      //     Icon(
      //       Icons.coronavirus_rounded,
      //       color: Colors.red,
      //     )
      //
      //   ],
      // ),
      drawer: Drawer(
        elevation: 0,
        child:ListView(
          children: [
                   UserAccountsDrawerHeader(
                    accountName: Text(""),
                    accountEmail: Text(""),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.person,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
              InkWell(
                onTap: (){},
                  child: ListTile(
                    title: Text("Global New Cases"),
                    leading: Icon(
                      Icons.pending
                    ),
                  ),
              ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Global Total Cases"),
                leading: Icon(
                    Icons.pending_actions
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Globally Recovered"),
                leading: Icon(
                    Icons.done
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Globally Total Deaths"),
                leading: Icon(
                    Icons.dangerous
                ),
              ),
            ),
            Divider(color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(top: 2,left: 10),
              child: Text("Hospital Details",style: TextStyle(fontWeight: FontWeight.bold,),),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Cumulative Hospitals"),
                leading: Icon(
                    Icons.local_hospital_sharp
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Treatment Hospitals"),
                leading: Icon(
                    Icons.local_hospital_outlined
                ),
              ),
            ),

          ],
        ) ,
      ),

      body: Column(
        children: [

          //This is homeScreen Carousel Container
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width:double.infinity,
              child: ImageSlider(),
            ),
          ),
           Container(
             margin: EdgeInsets.only(top: 50,left: 10),
            height: 50,
            width: double.infinity,
            child: Text("Select Category",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
          ),

        //This is Horizental Line
          Container(
            //color: Theme.of(context).focusColor,
            margin: EdgeInsets.only(top: 10),
            height: 120,
            width:double.infinity,
            child: HorizontalList(),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   height: 200,
          //   //color: Colors.deepPurple,
          //   child:BottomCard(),
          // )
        ],
      )
    );
  }
}
