import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:review_task/model/fetch_model.dart';

class FetchServices {
  Future<List<FetchModel>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData=jsonDecode(response.body);
      return jsonData.map((json) => FetchModel.fromJSon(json)).toList();
    } else {
      throw Exception('unable to load data');
    }
  }
}
