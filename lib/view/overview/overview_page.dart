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
          return FutureBuilder<List<Competition>?>(
              future: model.loadAllCompetitionsAsync(),
              builder: (context, future) {
                if (!future.hasData)
                  return Center(child: CircularProgressIndicator()); // Display empty container if the list is empty
                else {
                  List<Competition> list = future.data!;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return _CompetitionCard(index, model);
                      });
                }
              });
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
          (competitions) => competitions.getByPosition(index)
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('climbing.jpg'),
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Wrap(
                direction: Axis.vertical,
                spacing: 50,
                children: [
                  Text(item.title),
                  Text(item.getFromDate()),
                  GestureDetector(
                      child: Text('Website'),
                      onTap: () => model.launchInBrowser(item.link)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
