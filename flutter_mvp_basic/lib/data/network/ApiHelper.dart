import 'dart:async';
import 'dart:io';

import 'package:flutter_mvp_app/data/network/Method.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
    print("restApi ${_action}");
    Response? response;
    try {
      String action = _action + ".php";

      if (method == Method.GET) {
        print(_action + param);
        response = await http.get(Uri.parse(action + param));
      } else if (method == Method.POST) {
        response = await http.post(Uri.parse(action), body: object);
      }
    }catch (e) {
      String text = "";
      if (e is SocketException) {
        //treat SocketException
        text = "Socket exception: ${e.toString()}";
      } else if (e is TimeoutException) {
        //treat TimeoutException
        text = "Timeout exception: ${e.toString()}";
      } else {
        text = "Unhandled exception: ${e.toString()}";
      }
      print(text);
    }
    print(response);
    return response;
  }
}
