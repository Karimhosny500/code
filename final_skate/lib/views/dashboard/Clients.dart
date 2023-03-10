// To parse this JSON data, do
//
//     final clients = clientsFromJson(jsonString);

import 'dart:convert';

Clients clientsFromJson(String str) => Clients.fromJson(json.decode(str));

String clientsToJson(Clients data) => json.encode(data.toJson());

class Clients {
  Clients({
    required this.id,
    required this.name,
    required this.date,
    required this.year,
    required this.number,
    required this.parentName,
    required this.startDate,
    required this.courseTime,
    required this.birthDay,
    required this.session,
    required this.coach,
  });

  String id;
  String name;
  String date;
  int year;
  String number;
  String parentName;
  String startDate;
  String courseTime;
  String birthDay;
  String session;
  String coach;

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        year: json["year"],
        number: json["number"],
        parentName: json["parentName"],
        startDate: json["startDate"],
        courseTime: json["courseTime"],
        birthDay: json["BirthDay"],
        session: json["session"],
        coach: json["coach"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "year": year,
        "number": number,
        "parentName": parentName,
        "startDate": startDate,
        "courseTime": courseTime,
        "BirthDay": birthDay,
        "session": session,
        "coach": coach,
      };
}
