import 'dart:async';

import 'package:flutter_mvp_app/data/network/Method.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future restApi(String _action, String param, String method,
      Map<String, String> object) async {
    /*
      Map<String, String> body = {
'name': 'doodle',
'color': 'blue',
'teamJson': {
  'homeTeam': {'team': 'Team A'},
  'awayTeam': {'team': 'Team B'},
  },
};
    */
    String action = _action + ".php";
    var response;
    if (method == Method.GET) {
      print(_action + param);
      response = await http.get(Uri.parse(action + param));
    } else if (method == Method.POST) {
      response = await http.post(Uri.parse(action), body: object);
    }

    return response;
  }
}
