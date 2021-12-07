import 'dart:convert';

import 'package:app_restaurante/modelos/politicas_response.dart';
import 'package:http/http.dart' as http;

class PoliticasServicio {
  final String _baseUrl = 'wsc.fabricasoftware.co';

  Future<List<Politicas>> getPoliticas() async {
    var url = Uri.https(_baseUrl, 'api/politicas?ver', {'': '{}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);
      List<Politicas> lst = [];
      for (var politicas in decoded['datos']) {
        var politica = Politicas.fromJson(politicas);
        lst.add(politica);
      }
      return lst;
    }
    return [];
  }
}
