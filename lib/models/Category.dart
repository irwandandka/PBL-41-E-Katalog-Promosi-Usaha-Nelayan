class Category {
  String name;
  int id;

  Category({
    required this.name,
    required this.id
  });

  String get _name => name;
  int get _id => id;

  factory Category.fromJson(Map<String, dynamic> json) {
    // return switch (json) {
    //   {
    //     'id': int id,
    //     'name': String name,
    //   } =>
    //     Category(
    //       id: id,
    //       name: name,
    //     ),
    //   _ => throw const FormatException('Failed to load album.'),
    // };
    return Category(
      id: json["id"],
      name: json["name"]
    );
  }
}