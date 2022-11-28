import 'package:climbing/model/competition.dart';
import 'package:climbing/model/location.dart';

class CompetitionService {
  List<Competition> competitions = [];

  CompetitionService() {
    competitions = [
      Competition(
          'VELS WINTER-CUP 2022',
          Location(),
          DateTime(2022, 11, 26),
          DateTime(2022, 12, 15),
          Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
      Competition(
          'VELS WINTER-CUP 2022',
          Location(),
          DateTime(2022, 11, 26),
          DateTime(2022, 12, 15),
          Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
    ];
  }
}
