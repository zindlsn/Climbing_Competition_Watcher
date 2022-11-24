import 'package:climbing/model/location.dart';
import 'package:intl/intl.dart';

class Competition {
  String title;
  Uri link;
  Location location;
  DateTime from;
  DateTime to;

  Competition(this.title, this.location, this.from, this.to, this.link);

  getFromDate() => DateFormat('dd.MM.yyyy').format(from);
}
