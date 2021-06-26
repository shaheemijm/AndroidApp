// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.updateDateTime,
    required this.localNewCases,
    required this.localTotalCases,
    required this.localTotalNumberOfIndividualsInHospitals,
    required this.localDeaths,
    required this.localNewDeaths,
    required this.localRecovered,
    required this.localActiveCases,
    required this.globalNewCases,
    required this.globalTotalCases,
    required this.globalDeaths,
    required this.globalNewDeaths,
    required this.globalRecovered,
    required this.totalPcrTestingCount,
    required this.dailyPcrTestingData,
    required this.hospitalData,
  });

  DateTime updateDateTime;
  int localNewCases;
  int localTotalCases;
  int localTotalNumberOfIndividualsInHospitals;
  int localDeaths;
  int localNewDeaths;
  int localRecovered;
  int localActiveCases;
  int globalNewCases;
  int globalTotalCases;
  int globalDeaths;
  int globalNewDeaths;
  int globalRecovered;
  int totalPcrTestingCount;
  List<DailyPcrTestingDatum> dailyPcrTestingData;
  List<HospitalDatum> hospitalData;

  factory Data.fromJson(Map <String, dynamic> json) => Data(
    updateDateTime: DateTime.parse(json["update_date_time"]),
    localNewCases: json["local_new_cases"],
    localTotalCases: json["local_total_cases"],
    localTotalNumberOfIndividualsInHospitals: json["local_total_number_of_individuals_in_hospitals"],
    localDeaths: json["local_deaths"],
    localNewDeaths: json["local_new_deaths"],
    localRecovered: json["local_recovered"],
    localActiveCases: json["local_active_cases"],
    globalNewCases: json["global_new_cases"],
    globalTotalCases: json["global_total_cases"],
    globalDeaths: json["global_deaths"],
    globalNewDeaths: json["global_new_deaths"],
    globalRecovered: json["global_recovered"],
    totalPcrTestingCount: json["total_pcr_testing_count"],
    dailyPcrTestingData: List<DailyPcrTestingDatum>.from(json["daily_pcr_testing_data"].map((x) => DailyPcrTestingDatum.fromJson(x))),
    hospitalData: List<HospitalDatum>.from(json["hospital_data"].map((x) => HospitalDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "update_date_time": updateDateTime.toIso8601String(),
    "local_new_cases": localNewCases,
    "local_total_cases": localTotalCases,
    "local_total_number_of_individuals_in_hospitals": localTotalNumberOfIndividualsInHospitals,
    "local_deaths": localDeaths,
    "local_new_deaths": localNewDeaths,
    "local_recovered": localRecovered,
    "local_active_cases": localActiveCases,
    "global_new_cases": globalNewCases,
    "global_total_cases": globalTotalCases,
    "global_deaths": globalDeaths,
    "global_new_deaths": globalNewDeaths,
    "global_recovered": globalRecovered,
    "total_pcr_testing_count": totalPcrTestingCount,
    "daily_pcr_testing_data": List<dynamic>.from(dailyPcrTestingData.map((x) => x.toJson())),
    "hospital_data": List<dynamic>.from(hospitalData.map((x) => x.toJson())),
  };
}

class DailyPcrTestingDatum {
  DailyPcrTestingDatum({
    required this.date,
    required this.count,
  });

  DateTime date;
  String count;

  factory DailyPcrTestingDatum.fromJson(Map<String, dynamic> json) => DailyPcrTestingDatum(
    date: DateTime.parse(json["date"]),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "count": count,
  };
}

class HospitalDatum {
  HospitalDatum({
    required this.id,
    required this.hospitalId,
    required this.cumulativeLocal,
    required this.cumulativeForeign,
    required this.treatmentLocal,
    required this.treatmentForeign,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.cumulativeTotal,
    required this.treatmentTotal,
    required this.hospital,
  });

  int id;
  int hospitalId;
  int cumulativeLocal;
  int cumulativeForeign;
  int treatmentLocal;
  int treatmentForeign;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int cumulativeTotal;
  int treatmentTotal;
  Hospital hospital;

  factory HospitalDatum.fromJson(Map<String, dynamic> json) => HospitalDatum(
    id: json["id"],
    hospitalId: json["hospital_id"],
    cumulativeLocal: json["cumulative_local"],
    cumulativeForeign: json["cumulative_foreign"],
    treatmentLocal: json["treatment_local"],
    treatmentForeign: json["treatment_foreign"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    cumulativeTotal: json["cumulative_total"],
    treatmentTotal: json["treatment_total"],
    hospital: Hospital.fromJson(json["hospital"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hospital_id": hospitalId,
    "cumulative_local": cumulativeLocal,
    "cumulative_foreign": cumulativeForeign,
    "treatment_local": treatmentLocal,
    "treatment_foreign": treatmentForeign,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "cumulative_total": cumulativeTotal,
    "treatment_total": treatmentTotal,
    "hospital": hospital.toJson(),
  };
}

class Hospital {
  Hospital({
    required this.id,
    required this.name,
    required this.nameSi,
    required this.nameTa,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String nameSi;
  String nameTa;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    id: json["id"],
    name: json["name"],
    nameSi: json["name_si"],
    nameTa: json["name_ta"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_si": nameSi,
    "name_ta": nameTa,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
