import 'package:flutter/material.dart';
import 'package:products_flutterapp/ui/views/details.dart';

import '../../data/entity/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Product>> loadProducts() async {
    var productList = <Product>[];

    var u1 = Product(
        id: 1, name: "Macbook Pro 14", photo: "bilgisayar.png", price: 43000);
    var u2 = Product(
        id: 2, name: "Rayban Club Master", photo: "gozluk.png", price: 2500);
    var u3 = Product(
        id: 3, name: "Sony ZX Series", photo: "kulaklik.png", price: 40000);
    var u4 =
        Product(id: 4, name: "Gio Armani", photo: "parfum.png", price: 2000);
    var u5 =
        Product(id: 5, name: "Casio X Series", photo: "saat.png", price: 8000);
    var u6 =
        Product(id: 6, name: "Dyson V8", photo: "supurge.png", price: 18000);
    var u7 =
        Product(id: 7, name: "IPhone 13", photo: "telefon.png", price: 32000);
    productList.add(u1);
    productList.add(u2);
    productList.add(u3);
    productList.add(u4);
    productList.add(u5);
    productList.add(u6);
    productList.add(u7);

    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SIYASHOP",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Product>>(
        future: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var productList = snapshot.data;

            return ListView.builder(
              itemCount: productList!.length,
              itemBuilder: (context, index) {
                var product = productList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(product)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 128,
                              width: 128,
                              child: Image.asset("photos/${product.photo}")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text((product.name)),
                            const SizedBox(height: 10,),
                            Text(
                              "${product.price} TL",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 10,),
                            ElevatedButton(
                                onPressed: () {
                                  print("${product.name} added in basket. ✔");
                                }, child: const Text("Add Basket 👀")),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
