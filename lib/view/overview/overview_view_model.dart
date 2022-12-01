import 'dart:collection';

import 'package:climbing/globals/globals.dart';
import 'package:climbing/model/competition.dart';
import 'package:climbing/services/competition_service.dart';
import 'package:climbing/services/dump_competiton_service.dart';
import 'package:climbing/services/icompetition_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:climbing/main.dart';

class OverviewViewModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Competition> _items = [];
  ICompetitionService competitionService = CompetitionService();

  OverviewViewModel() {
    if (prodMode) {
      competitionService = CompetitionService();
    } else {
      competitionService = DumpCompetitionService();
    }
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Competition> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  Future<List<Competition>?> loadAllCompetitionsAsync() async {
    removeAll();
    List<Competition>? comps = await competitionService.getCompetitionsAsync();
    if (comps != null) {
      for (Competition comp in comps) {
        add(comp);
      }
    }
    return _items;
  }

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Competition item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    // notifyListeners();
  }

  Competition getByPosition(int index) {
    return _items[index];
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
