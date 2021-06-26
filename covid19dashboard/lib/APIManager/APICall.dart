
import 'package:covid19dashboard/models/jsonData.dart';

import 'package:http/http.dart' as http;
class ApiCall {


  Future <Welcome> getData() async{
    //Future <http.Response> dataUrl =
      var url = Uri.parse('https://www.hpb.health.gov.lk/api/get-current-statistical');
    // in this point data will come from server and we need to get it to variable
      http.Response response = await http.get(url);
    //check if receiving response status code success or not
      //print(response.body);
      var resBody = response.body;
    if(resBody.length != 0) {
      //if success return by converting json to object
     final welcome = welcomeFromJson(resBody);
     return welcome;

    } else{
      throw Exception('Failed to load Data');
    }
    }

}