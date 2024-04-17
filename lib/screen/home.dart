import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users=[];
  fetchUser()
  async {
    const url="https://randomuser.me/api/?results=5";
    Uri uri=Uri.parse(url);
    final response=await http.get(uri);
    String body=response.body;
    Map json=jsonDecode(body);
    setState(() {
      users=json['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Rest APIs"),
          ),
      body: ListView.builder(
        itemCount: users.length,
      itemBuilder:(context, index) {
          final user=users[index];
          final imgUrl=user["picture"]["thumbnail"];
         final name= user["name"]["first"];
         final email=user["email"];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),),
          title: Text(name),
          subtitle: Text(email),
        );
      },),
      floatingActionButton: FloatingActionButton(
          onPressed: fetchUser),
    );
  }
}
