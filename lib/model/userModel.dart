import 'package:rest_apis/model/user_name.dart';

class UserModel{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;

  UserModel({
    required this.gender,
    required this.nat,
    required this.email,
    required this.phone,
    required this.cell,
    required this.name
});
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}

