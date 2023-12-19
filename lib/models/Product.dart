
class Product {
  String name;
  int price;
  String imagePath;
  int rating;
  String description;
  String seller;
  int isBestSeller;

  Product({
    required this.name, 
    required this.price, 
    required this.imagePath, 
    required this.rating,
    required this.description,
    required this.seller,
    required this.isBestSeller,
  });

  String get _name => name;
  int get _price => price;
  String get _imagePath => imagePath;
  int get _rating => rating;
  String get _description => description;
  String get _seller => seller;
  int get _isBestSeller => isBestSeller;
}