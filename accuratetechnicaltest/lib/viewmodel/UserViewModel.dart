import 'dart:convert';
import 'package:accuratetechnicaltest/model/UserApi.dart';
import 'package:http/http.dart' as http;

class UserViewModel {
  Future<List<UserApi>> fetchUsers() async {
    final response = await http.get(Uri.parse(
        'https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => UserApi.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<String>> fetchAvailableCities() async {
    final response = await http.get(Uri.parse(
        'https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => e['city']).toList().cast<String>();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
