import 'package:flutter/material.dart';
import 'package:katalog_usaha_nelayan/theme/colors.dart';
import '../models/Product.dart';
import 'package:intl/intl.dart';



class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // Image
                  Image.asset(
                    widget.product.imagePath,
                    height: 200,
                  ),
                  
                  const SizedBox(height: 25),
            
                  // rating
                  Visibility(
                    visible: widget.product.isBestSeller,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
                        // Text(
                        //   widget.product.rating,
                        //   style: TextStyle(
                        //     color: Colors.grey[600],
                        //     fontWeight: FontWeight.bold 
                        //   ),)
                      ],
                    ),
                  ),
                  

                  const SizedBox(height: 10),
                  
                  // Product name
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 25),

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
                    widget.product.description,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                      height: 2
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                      Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp ',
                        decimalDigits: 2,
                      ).format(widget.product.price),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}