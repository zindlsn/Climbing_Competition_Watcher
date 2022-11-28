import 'dart:collection';

import 'package:climbing/model/competition.dart';
import 'package:climbing/services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OverviewViewModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Competition> _items = [];

  CompetitionService competitionService = CompetitionService();

  OverviewViewModel() {
    _items.addAll(competitionService.competitions);
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Competition> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Competition item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
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
