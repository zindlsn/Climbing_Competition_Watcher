import 'package:climbing/model/competition.dart';
import 'package:climbing/model/location.dart';
import 'package:climbing/services/api_controller.dart';

class CompetitionService {
  List<Competition> competitions = [];
  ApiController apiController = ApiController();

  CompetitionService() {
    competitions = [
      Competition(
          title: 'VELS WINTER-CUP 2022',
          location: Location(),
          from: DateTime(2022, 11, 26),
          to: DateTime(2022, 12, 15),
          link: Uri(
              scheme: 'https',
              path: 'vels-stuttgart.de/winter-cup-vels-2022/')),
    ];
  }

  Future<List<Competition>?> getCompetitionsAsync() async {
    return await apiController.getCompetitions();
  }

  Future<List<Competition>?> getNextCompetition() async {
    return await apiController.getNextCompetition();
  }
}
