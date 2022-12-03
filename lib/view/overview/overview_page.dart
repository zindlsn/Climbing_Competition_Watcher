import 'dart:io';

import 'package:climbing/model/competition.dart';
import 'package:climbing/view/overview/overview_view_model.dart';
import 'package:climbing/view/widgets/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
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
        title: Text("Competitons"),
      ),
      body: Consumer<OverviewViewModel>(
        builder: (context, model, child) {
          return FutureBuilder<List<Competition>?>(
              future: model.loadAllCompetitionsAsync(),
              builder: (context, future) {
                if (!future.hasData)
                  return Center(child: CircularProgressIndicator());
                else if (future.data!.isEmpty) {
                  return Center(child: Text('There are no current competitions'));
                } // Display empty container if the list is empty
                else {
                  List<Competition> list = future.data!;
                  return _selfView(model);
                }
              });
        },
      ),
      backgroundColor: Colors.blueGrey[100],
    );
  }

  @override
  void initState() {}
}

Widget _selfView(OverviewViewModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: GroupedListView<Competition, String>(
            elements: model.items,
            groupBy: (item) => (item.getFromDate()),
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) => item2.city.compareTo(item1.city),
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: false,
            groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
            itemBuilder: (c, element) {
              return Container(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  width: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.blueAccent,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.ads_click,
                            color: Colors.blueGrey[100],
                          ),
                          GestureDetector(
                            onTap: () => model
                                .launchInBrowser(Uri.parse("www.google.de")),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: Text(
                                          'Gravitation 8',
                                          style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              color: Colors.blueGrey[100],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: Text(
                                          'Einstein Boulderhalle',
                                          style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text(
                                        '12.11.2022 - 12.12.2022',
                                        style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 16.0),
                                        child: CustomPaint(
                                          size: Size(100, 10),
                                          painter: LinePainter(),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_pin,
                                              color: Colors.blueAccent[100]),
                                          Text(
                                            element.city + " 40 km",
                                            style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                color: Colors.white70,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.web,
                                  color: Colors.blueAccent[100],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Zur Anmeldung',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      )
    ],
  );
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Widget _getView() {
  return Container(
    width: 200,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.pink,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album, size: 70),
            title: Text('Gravitation', style: TextStyle(color: Colors.white)),
            subtitle:
                Text('Boulderhalle', style: TextStyle(color: Colors.white)),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: <Widget>[
                OutlinedButton(
                  child:
                      const Text('Edit', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Text('Delete',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _CompetitionCard extends StatelessWidget {
  int index;
  OverviewViewModel model;

  _CompetitionCard(this.index, this.model);

  @override
  Widget build(BuildContext context) {
    Competition item = context.select<OverviewViewModel, Competition>(
        (competitions) => competitions.getByPosition(index));
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
