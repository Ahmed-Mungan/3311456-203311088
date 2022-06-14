import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myproject/models/food_model.dart';

class FoodService {
  Future<Food> getFoods() async {
    String url = "https://reqres.in/api/users?page=2";
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == HttpStatus.ok) {
      return foodFromJson(response.body);
    }

    throw response.body;
  }
}
