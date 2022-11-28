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
            itemBuilder: (context, index) {
              return _CompetitionCard(index, model);
            },
          );
        }));
  }
}

class _CompetitionCard extends StatelessWidget {
  int index;
  OverviewViewModel model;

  _CompetitionCard(this.index, this.model);

  @override
  Widget build(BuildContext context) {
    Competition item = context.select<OverviewViewModel, Competition>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
      (competitions) => competitions.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage('climbing.jpg'),height: 200,),
            Padding(
              padding: const EdgeInsets.only(left:32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.getFromDate()),
                  Text(item.title),
                  GestureDetector(child: Text('Website'), onTap: () => model.launchInBrowser(item.link)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
