import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldDuration {
  String where;
  late String when;
  String identity;
  String link;
  late bool isBright;

  WorldDuration(
      {required this.where, required this.identity, required this.link});

  Future<void> takeAkoko() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
      Map were = jsonDecode(response.body);
      //print(were);

      String datetime = were['datetime'];
      String offset = were['utc_offset'].substring(1, 3);

      //print(datetime);
      //print(offset);

      DateTime asap = DateTime.parse(datetime);
      asap = asap.add(Duration(hours: int.parse(offset)));
      //print(immed);

      isBright = asap.hour > 5 && asap.hour < 18 ? true : false;
      when = DateFormat.jm().format(asap);
    } catch (e) {
      when = 'Failed';
    }
  }
}