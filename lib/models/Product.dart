
class Product {
  String name;
  int price;
  String imagePath;
  String rating;
  String description;
  bool isBestSeller;

  Product({
    required this.name, 
    required this.price, 
    required this.imagePath, 
    required this.rating,
    required this.description,
    required this.isBestSeller,
  });

  String get _name => name;
  int get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  String get _description => description;
  bool get _isBestSeller => isBestSeller;
}