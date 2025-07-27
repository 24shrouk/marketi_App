import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marketi/core/storage_helper/app_shared_pref.dart';
import 'package:marketi/features/home/model/response/get_products.dart';

abstract class ApiHomeData {
  static Future<GetProductsResponse> getProducts() async {
    // https://marketi-app.onrender.com/api/v1/home/products
    String token = SharedPreferencesHelper.getData(key: 'token').toString();
    Uri url = Uri.https('marketi-app.onrender.com', '/api/v1/home/products');
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var responseBody = response.body;
    if (response.statusCode == 200) {
      var json = jsonDecode(responseBody);
      return GetProductsResponse.fromJson(json);
    } else {
      throw Exception('Failed to catch data : ${response.statusCode}');
    }
  }
}
