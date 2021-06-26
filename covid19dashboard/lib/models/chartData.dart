import 'dart:ui';

// class Task{
  //
  //   pieData(){
  //    //In here we use chart data collection by using method...
  //
  //    var pieData = [
  //      Tasks("Work", 35.5, Color(0xffc7a00c)),
  //      Tasks ("Eat",  5.5, Color(0xff4d2eb3)),
  //       Tasks ("Work", 25.0,Color(0xffdc39a7)),
  //       Tasks ("Work", 10, Color(0xffa10636)),
  //       Tasks ("Work", 20, Color(0xff27bd0f)),
  //     ];
  //    List <charts.Series<Tasks,String>> _seriesData;
  //
  //    _seriesData.add(
  //      charts.Series(
  //        data: pieData,
  //        domainFn: (Tasks tasks,_)=> tasks.task, // this is call x value
  //        measureFn: (Tasks tasks,_)=> tasks.taskValue, // this is y value
  //         colorFn: (Tasks tasks,_)=> charts.ColorUtil.fromDartColor(tasks.colorValue),
  //         id: "DailyTasks",
  //        labelAccessorFn: (Tasks lblValue,_) => "${lblValue.taskValue}",
  //      ),
  //    );
  //         return _seriesData;
  // }

// }
class Tasks{
       late String task;
       late double taskValue;
       late Color colorValue;

       Tasks(this.task, this.taskValue, this.colorValue);
}
class Pollution {
       late String place;
       late int year;
       late int quantity;

      Pollution(this.place, this.year, this.quantity);
}

