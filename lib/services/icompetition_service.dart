import 'package:climbing/model/competition.dart';

abstract class ICompetitionService {
  Future<List<Competition>?> getCompetitionsAsync();

  Future<List<Competition>?> getNextCompetition();

  Future<List<Competition>?> getOngoingCompetitions();
}
