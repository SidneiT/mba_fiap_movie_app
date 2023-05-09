import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/utils/constants.dart';

class Api {
  Future<Map<String, dynamic>> get(
      String endpoint, Map<String, dynamic> params) async {
    params.addAll({
      'api_key': Constants.apiKey,
    });

    try {
      Uri getRequest = Uri.https(Constants.apiDomain, endpoint, params);

      var response = await http.get(getRequest);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return Future.sync(() => data);
      } else {
        return Future.error(response.statusCode);
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
