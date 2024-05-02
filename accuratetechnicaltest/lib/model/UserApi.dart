import 'dart:convert';

List<UserApi> userGetApiFromJson(String str) =>
    List<UserApi>.from(json.decode(str).map((x) => UserApi.fromJson(x)));

String userGetApiToJson(List<UserApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserApi {
  String? name;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;
  String? id;
  String? query;

  UserApi({
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
    this.id,
    this.query,
  });

  factory UserApi.fromJson(Map<String, dynamic> json) => UserApi(
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        id: json["id"],
        query: json["query"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "city": city,
        "id": id,
        "query": query,
      };
}
