import 'package:climbing/model/competition.dart';
import 'package:climbing/model/location.dart';
import 'package:climbing/services/api_controller.dart';
import 'package:climbing/services/icompetition_service.dart';

class CompetitionService extends ICompetitionService{
  List<Competition> competitions = [];
  DatabaseService apiController = DatabaseService();

  CompetitionService() {
  }

  @override
  Future<List<Competition>?> getCompetitionsAsync() async {
    return await apiController.getCompetitions();
  }

  @override
  Future<List<Competition>?> getNextCompetition() async {
    return await apiController.getNextCompetition();
  }
}
