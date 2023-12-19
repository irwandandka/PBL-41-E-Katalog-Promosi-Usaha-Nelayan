import 'package:flutter/material.dart';
import '../models/Product.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  // final snapshot;
  final void Function()? onTap;
  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Image.asset(
                product.imagePath,
                height: 250.0,
                width: double.infinity,
                // fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.ci),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp ',
                            decimalDigits: 2,
                          ).format(product.price).toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                        ),
                        Text(product.seller),
                        // Icon(Icons.person)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Backup Old List
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
    //     margin: const EdgeInsets.only(left: 25),
    //     padding: const EdgeInsets.all(25),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Image.asset(product.imagePath, height: 140),
    //         Text(
    //           product.name,
    //           style: const TextStyle(fontSize: 20),
    //         ),
    //         SizedBox(
    //           width: 160,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 NumberFormat.currency(
    //                     locale: 'id',
    //                     symbol: 'Rp ',
    //                     decimalDigits: 2,
    //                   ).format(product.price).toString(),
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold, color: Colors.grey[700]),
    //               ),
    //               const Row(
    //                 children: [
    //                   // Icon(
    //                   //   Icons.star,
    //                   //   color: Colors.yellow[600],
    //                   // ),
    //                   // Text(
    //                   //   product.rating,
    //                   //   style: const TextStyle(color: Colors.grey),
    //                   // ),
    //                 ],
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
