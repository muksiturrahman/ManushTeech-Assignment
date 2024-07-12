import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BaseClient {
  //GET
  static const TIME_OUT = 30;

  get httpClient => null;

  Future<dynamic> getMethodWithoutHeader(String baseUrl) async {
    var url = Uri.parse(baseUrl);
    try {
      final response = await http.get(url);
      return _processResponse(response);
    } on SocketException {
      print('No Internet connection');
      return "{\"errorMessage\":\"No Internet connection\"}";
    } on TimeoutException {
      print('Api not responding');
      return "{\"errorMessage\":\"Api not responding\"}";
    } catch (e) {
      print('Unknown error ' + e.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      var responseJson = utf8.decode(response.bodyBytes);

      //var responseJson =response.body;
      print(responseJson);
      return responseJson;
    } else {
      print(response.statusCode);

      return null;
    }
  }
}