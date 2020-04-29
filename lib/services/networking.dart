import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final _url;

  NetworkHelper(this._url);

  Future<Map> getWeatherData() async {
    http.Response response = await http.get(_url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException(
          'Couldn\'t fetch the weather data. Response code: ${response.statusCode}');
    }
  }
}
