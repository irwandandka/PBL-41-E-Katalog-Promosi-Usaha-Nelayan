import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final dynamic category;
  late IconData iconName;
  final void Function()? onTap;
  CategoryTile({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if(category['name'] == 'Hasil Laut') {
      iconName = Icons.sailing;
    } else if(category['name'] == 'Penyewaan & Jasa') {
      iconName = Icons.pallet;
    } else if(category['name'] == 'Kreasi Kuliner') {
      iconName = Icons.restaurant;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              iconName,
              color: Colors.blue[500],
              ),
            title: Text(
              category['name'],
              style: const TextStyle(
                fontWeight: FontWeight.w600
              ),
              ),
            trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
    );
  }
}