
class Data{
  final int localNewCases;
  final int localTotalCases;
  final int localDeaths;
  final int localRecovered;
  final int localActiveCases;

  Data({required this.localNewCases,
    required this.localTotalCases, required this.localDeaths, required this.localRecovered, required this.localActiveCases});


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
        localActiveCases: json['local_active_cases'],
        localNewCases: json['local_new_cases'],
        localDeaths: json['local_deaths'],
        localRecovered: json['local_recovered'],
        localTotalCases: json['local_total_cases']
    );
  }

}