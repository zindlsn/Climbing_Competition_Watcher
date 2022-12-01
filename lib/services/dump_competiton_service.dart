import 'package:climbing/model/competition.dart';
import 'package:climbing/model/location.dart';
import 'package:climbing/services/icompetition_service.dart';
import 'package:flutter/material.dart';

class DumpCompetitionService extends ICompetitionService {
  List<Competition> competitions = [];

  @override
  Future<List<Competition>?> getCompetitionsAsync() {
    competitions = [
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
    ];

    Competition first = competitions[0]
      ..rating = 1.0
      ..startColor = Color(0xff6DC8F3)
      ..endColor = Color(0xff73A1F9)
      ..name = "Name"
      ..category = "Spasswettkampf";

    return Future.value(competitions);
  }

  @override
  Future<List<Competition>?> getNextCompetition() {
    // TODO: implement getNextCompetition
    throw UnimplementedError();
  }
}
