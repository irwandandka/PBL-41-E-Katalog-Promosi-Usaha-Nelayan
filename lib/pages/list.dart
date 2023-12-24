import 'package:flutter/material.dart';
import 'package:katalog_usaha_nelayan/components/button.dart';
import 'package:katalog_usaha_nelayan/models/Product.dart';
import 'package:katalog_usaha_nelayan/pages/product_detail.dart';
import '../components/ProductTile.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  final int categoryId;
  const ListPage({super.key, required this.categoryId});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  void navigateToProductDetail(productId) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductDetailPage(
          productId: productId,
        )));
  }

  int get categoryId => widget.categoryId;

  Future<List<dynamic>> fetctProducts(idCategory) async {
    String id = idCategory.toString();
    final response = await http
      .get(Uri.parse("https://katalog-usaha-nelayan-ae4cb679867e.herokuapp.com/api/product-category/" + id));

    if (response.statusCode == 200) {
      List<dynamic> dataProducts = json.decode(response.body);
      countProducts = dataProducts.length;
      return dataProducts;
    } else {
      throw Exception('Failed to load album');
    }
  }

  late Future<List> futureProducts;
  late int countProducts;

  void initState() {
    super.initState();
    // futureProducts = fetctProducts(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "Products",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 25),
          //   decoration: BoxDecoration(
          //       color: Colors.blue[900],
          //       borderRadius: BorderRadius.circular(20)),
          //   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const Text(
          //             "Get 50% Promo",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           const SizedBox(height: 25),
          //           Button(
          //               text: "Detail",
          //               onTap: () {
          //                 //
          //               })
          //         ],
          //       ),
          //       Image.asset(
          //         'lib/images/fish.png',
          //         height: 100,
          //       )
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 25),

          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: fetctProducts(categoryId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); // Menampilkan indikator loading selama pengambilan data.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Mengubah data menjadi list dan menampilkannya.
                  var data = snapshot.data;
                  return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      // Tampilkan item list sesuai kebutuhan.
                      var dataProduct = data?[index];
                      var productModel = Product(
                        name: dataProduct['name'], 
                        price: dataProduct['price'], 
                        imagePath: dataProduct['image'], 
                        rating: dataProduct['rating'], 
                        description: dataProduct['description'], 
                        seller: dataProduct['seller'], 
                        isBestSeller: dataProduct['isBestSeller']
                      );
                      return ProductTile(
                        product: productModel, onTap: () {
                        navigateToProductDetail(dataProduct['id']);
                      });
                    },
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
