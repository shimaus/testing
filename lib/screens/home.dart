import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lelah/models/product_model.dart';
import 'package:lelah/screens/detail_product.dart';
import 'package:lelah/screens/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProdukModel> product = [];
  String productURL =
      'https://mocki.io/v1/52c41978-6e31-4ea3-b917-01899e3ed373';

  getProduct() async {
    var response = await http.get(Uri.parse(productURL));
    if (response.statusCode == 200) {
      print(response.statusCode);
      List jsonResponse = json.decode(response.body);
      var result =
          jsonResponse.map((data) => ProdukModel.fromJson(data)).toList();
      setState(() {
        product = List.from(result);
      });
    } else {
      print("error");
    }
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPage()));
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) {
          var data = product[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProductPage(
                    produkModel: data,
                  ),
                ),
              );
            },
            leading: Image.network(data.cover),
            title: Text(data.name),
            subtitle: Text(data.price.toString()),
          );
        },
      ),
    );
  }
}
