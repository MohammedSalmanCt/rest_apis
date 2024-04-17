import '../model/userModel.dart';
import '../model/user_name.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserApi{
  static Future<List<UserModel>> fetchUser()
  async {
    const url="https://randomuser.me/api/?results=10";
    Uri uri=Uri.parse(url);
    final response=await http.get(uri);
    String body=response.body;
    Map json=jsonDecode(body);
    List<dynamic> results=json['results'];
 final users= results.map((e) {
        UserName userName=UserName(first: e['name']['first'],
            last: e['name']['last'],
            title: e['name']['title']);
        return UserModel(gender: e["gender"],
            nat: e['nat'],
            email: e['email'],
            phone: e['phone'],
            cell: e['cell'],
            name: userName
        );
      }).toList();
 return users;
  }
}