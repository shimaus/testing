import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lelah/models/user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> users = [];
  String userURL = 'https://jsonplaceholder.typicode.com/users';

  getUser() async {
    var response = await http.get(Uri.parse(userURL));
    if (response.statusCode == 200) {
      print(response.statusCode);
      List jsonResponse = json.decode(response.body);
      var result =
          jsonResponse.map((dataUser) => UserModel.fromJson(dataUser)).toList();
      setState(() {
        users = List.from(result);
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user'),
        actions: [
          IconButton(
              onPressed: () {
                getUser();
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          var dataUser = users[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.deepPurple,
              child: Text(dataUser.username.substring(0, 1)),
            ),
            title: Text(dataUser.name),
            subtitle: Text(dataUser.email),
          );
        },
      ),
    );
  }
}
