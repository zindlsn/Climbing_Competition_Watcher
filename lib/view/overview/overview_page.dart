import 'dart:io';

import 'package:climbing/model/competition.dart';
import 'package:climbing/view/overview/overview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Überschrift"),
        ),
        body: Consumer<OverviewViewModel>(builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.items.length,
            prototypeItem: ListTile(
              title: Text(model.items.first.title),
            ),
            itemBuilder: (context, index) {
              return _CompetitionCard(index);
            },
          );
        }));
  }
}

class _CompetitionCard extends StatelessWidget {
  int index;

  _CompetitionCard(this.index);

  @override
  Widget build(BuildContext context) {
    Competition item = context.select<OverviewViewModel, Competition>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
      (competitions) => competitions.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title),
          Text(item.link.toString()),
          Text(item.getFromDate()),
        ],
      ),
    );
  }
}
