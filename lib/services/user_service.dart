import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myproject/models/user_model.dart';

class Userservice {
  Future<Users> getUsers(String page) async {
    String url = "https://reqres.in/api/users?page=$page";
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == HttpStatus.ok) {
      return usersFromJson(response.body);
    }

    throw response.body;
  }
}
