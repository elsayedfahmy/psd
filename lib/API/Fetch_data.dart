import 'dart:convert';

import 'package:psd/Models/data_Model.dart';
import 'package:http/http.dart' as http;

Future<data_Model> fetchAlbum() async {
  final response = await http.get('https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('--------------response_valid ------------');
    return data_Model.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // for testing
    print('--------------response_Not_valid ------------');
    throw Exception('Failed to load album');
  }
}