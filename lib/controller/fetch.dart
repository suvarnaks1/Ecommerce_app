import 'dart:convert';

import 'package:ecomerce_app/models/ecomercemodel.dart';
import 'package:http/http.dart' as http;
Future<List<EcommerceModel>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://run.mocky.io/v3/0cb4226c-5196-4331-9dee-27a8c8687edb'));
print(response.statusCode);
print('ssssssssssssss');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON list.
      List<dynamic> productList = jsonDecode(response.body);
     return productList.map((productJson) => EcommerceModel.fromJson(productJson)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}