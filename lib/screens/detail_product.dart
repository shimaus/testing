import 'package:flutter/material.dart';
import 'package:lelah/models/product_model.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key, required this.produkModel});
  final ProdukModel produkModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Judul Produk'),
      ),
      body: ListView(
        children: [
          Container(
            height: size.height * 0.4,
            width: double.infinity,
            child: Image.network(produkModel.cover),
          ),
          Text(
            produkModel.name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(produkModel.price.toString()),
          SizedBox(
            height: 10,
          ),
          Text(
            produkModel.desc,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
