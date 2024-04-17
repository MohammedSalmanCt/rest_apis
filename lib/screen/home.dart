import 'package:flutter/material.dart';
import 'package:rest_apis/model/userModel.dart';
import 'package:rest_apis/services/user_api.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> users=[];

  fetchUser()
  async {
    final response=await UserApi.fetchUser();
    setState(() {
      users=response;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Rest APIs"),
            ),
        body: ListView.builder(
          itemCount: users.length,
        itemBuilder:(context, index) {
            final user=users[index];
           final phone= user.phone;
           final email=user.email;
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(phone),
          );
        },),
      ),
    );
  }
}
