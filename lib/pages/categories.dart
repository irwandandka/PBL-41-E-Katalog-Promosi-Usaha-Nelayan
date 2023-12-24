import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:katalog_usaha_nelayan/pages/list.dart';
import 'package:katalog_usaha_nelayan/components/CategoryTile.dart';
import 'package:katalog_usaha_nelayan/models/Category.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List categories = [
    Category(name: 'Hasil Laut', id: 1),
    Category(name: 'Penyewaan & Jasa', id: 2),
    Category(name: 'Aneka Kuliner', id: 3),
  ];

  Future<List<dynamic>> fetchCategory() async {
    final response = await http
        .get(Uri.parse('https://katalog-usaha-nelayan-ae4cb679867e.herokuapp.com/api/categories'));

    if (response.statusCode == 200) {
      List<dynamic> dataCategories = json.decode(response.body);
      return dataCategories;
    } else {
      throw Exception('Failed to load album');
    }

  }

  late Future<List> futureCategory;

  void initState(){
    super.initState();
  }

  void navigateToProductList(categoryId) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListPage(
          categoryId: categoryId,
        )));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: fetchCategory(),
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
                      var dataCategory = data?[index];
                      return CategoryTile(category: dataCategory, onTap: () {
                        navigateToProductList(dataCategory['id']);
                      });
                    },
                  );
                }
              },
            )
          )
        ],
      ),
    );
  }
}

