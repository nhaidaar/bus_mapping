import 'dart:convert';

import 'package:maps_route/models/company_model.dart';
import 'package:http/http.dart' as http;
import 'package:maps_route/shared/value.dart';

class ApiService {
  Future<List<CompanyModel>> fetchData() async {
    final response = await http.get(Uri.parse(restApi));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => CompanyModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
