import 'dart:ui';

import 'package:climbing/model/location.dart';
import 'package:intl/intl.dart';

class Competition extends Comparable<Competition>{
  String title;
  Uri link;
  Location location;
  DateTime? from;
  DateTime? to;

  late final String name;
  late final String category;
  late final double rating;
  late final Color startColor;
  late final Color endColor;
  String city;

  Competition(
      {required this.title,
      required this.location,
      required this.from,
      required this.to,
      required this.link,
      required this.city}){
    name =" Competiotns=!=";
  }

  getFromDate() => DateFormat('dd.MM.yyyy').format(from!);

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
      title: json["name"],
      location: Location(),
      from: json['start'] != null ? DateTime.parse(json['start']) : null,
      to: json['end'] != null ? DateTime.parse(json['end']) : null,
      city: "Ulm",
      link: Uri.parse('test'));

  Map<String, dynamic> toJson() => {"title": title, "from": from, "to": to};

  @override
  int compareTo(Competition other) {
    return 0;
  }
}
