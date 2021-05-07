import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ServiceFactory {
  final String routeBase = 'https://jsonplaceholder.typicode.com/';
  final String routeUsers = 'users';

  Future<String> handleMethod(String method, String url, {String send}) async {
    try {
      method = method.toUpperCase();

      print('$method: $url');

      Response response;

      response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // print('Response: ${response.body}');
        return response.body;
      } else {
        throw Exception(
            'Failed to load ${response.request.method} code: ${response.statusCode}');
      }
    } catch (e) {
      print('$e');
      return null;
    }
  }
}
