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
          city: "Ulm",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          city: "Atuttgart",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          city: "Btuttgart",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          city: "Dtuttgart",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          city: "Stuttgart",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          city: "Stuttgart",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 21),
          to: DateTime(2022, 12, 15),
          city: "Stuttgart",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          city: "Ludwigsburg",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 20),
          to: DateTime(2022, 12, 15),
          city: "Ludwigsburg",
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
    ];

    return Future.value(competitions);
  }

  @override
  Future<List<Competition>?> getNextCompetition() {
    // TODO: implement getNextCompetition
    throw UnimplementedError();
  }
}
