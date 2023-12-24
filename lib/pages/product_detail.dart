import 'package:flutter/material.dart';
import 'package:katalog_usaha_nelayan/theme/colors.dart';
import '../models/Product.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailPage extends StatefulWidget {
  // final Product product;
  final int productId;
  late bool bestSeller;
  late bool isLoad = false;
  late int rating;
  ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int get productId => widget.productId;
  late int price;
  late String phoneNumber;
  Future<Map<String, dynamic>> fetctProduct(idProduct) async {
    String id = idProduct.toString();
    final response = await http
      .get(Uri.parse("https://katalog-usaha-nelayan-ae4cb679867e.herokuapp.com/api/product/" + id));

    if (response.statusCode == 200) {
      Map<String, dynamic> dataProduct = json.decode(response.body);
      // print(dataProduct);
      return dataProduct;
    } else {
      throw Exception('Failed to load album');
    }
  }

  late Future<Map> futureProduct;

  void launchWhatsApp(phoneNumber) async {
  // String phoneNumber = '+6281261564458'; // Replace with the desired phone number
  // final Uri url = Uri.parse("https://wa.me/6282169784156");
  String message = Uri.encodeFull('Halo, Saya ingin memesan barang');
  final Uri url = Uri.parse("whatsapp://send?phone=$phoneNumber&text=$message");
  launchUrl(url);
}

  void initState() {
    price = 80000;
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listview Product Detail
          Expanded(
            child: FutureBuilder(
              future: fetctProduct(productId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var product = snapshot.data;
                  if(product?['isBestSeller'] == true) {
                    widget.bestSeller = true;
                  } else {
                    widget.bestSeller = false;
                  }
                  price = product?['Price'];
                  widget.rating = product?['Rating'];
                  phoneNumber = product?['SellerContact'];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListView(
                      children: [
                        // Image
                        // Image.asset(
                        //   product?['Image'],
                        //   height: 200,
                        // ),

                        Image.network(
                          product?['Image'],
                          width: MediaQuery.of(context).size.width,
                        ),
                        
                        const SizedBox(height: 25),
                  
                        // rating
                        Visibility(
                          visible: widget.bestSeller,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[800],
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 20),
                                    // rating number
                                    Text(
                                      "Best Seller",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                      
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                
                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product?['Name'],
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star, 
                                  size: 25, 
                                  color: Colors.amber[300],
                                ),
                                Text(
                                  widget.rating.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold 
                                  ),
                                ),
                              ],
                            )
                          ]
                        ),
                        
                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 2,
                              ).format(product?['Price']),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[400]
                              ),
                            ),

                            Text(
                              product?['Code'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.person
                            ),
                            const SizedBox(width: 5),
                            Text(
                              product?['Seller'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                
                        // Description
                        Text(
                          "Deskripsi",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                
                        const SizedBox(height: 10),
                
                        Text(
                          product?['Description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 15,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the function to launch WhatsApp
          launchWhatsApp(phoneNumber);
        },
        child: const Icon(
          Icons.message,
        ),
      ),
    );
  }
}