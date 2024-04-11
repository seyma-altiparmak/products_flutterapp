import 'package:flutter/material.dart';
import 'package:products_flutterapp/data/entity/product.dart';

class DetailPage extends StatefulWidget {
  Product productList;

  DetailPage(this.productList);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SIYASHOP Detail",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        Image.asset("photos/${widget.productList.photo}"),
            Text("${widget.productList.price} TL", style: const TextStyle(fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
