import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:accuratetechnicaltest/model/UserApi.dart';

class UserPostViewModel {
  Future<void> postUser(UserApi user) async {
    final response = await http.post(
      Uri.parse(
          'https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to post user');
    }
  }
}
