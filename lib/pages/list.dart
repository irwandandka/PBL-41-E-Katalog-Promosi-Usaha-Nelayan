import 'package:flutter/material.dart';
import 'package:katalog_usaha_nelayan/components/button.dart';
import 'package:katalog_usaha_nelayan/models/Product.dart';
import 'package:katalog_usaha_nelayan/pages/product_detail.dart';
import '../components/ProductTile.dart';
import 'package:intl/intl.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // final FirebaseDatabase database = FirebaseDatabase.instance;
  // final ref = FirebaseDatabase.instance.ref('products');

  List products = [
    Product(
        name: "Ikan Kakap",
        price: 20000,
        imagePath: 'lib/images/kakap.png',
        rating: '4.2',
        isBestSeller: false,
        description: 'Ikan kakap adalah pilihan utama bagi pencinta hidangan laut. Dikenal dengan dagingnya yang lembut, manis, dan berbutir halus, kakap adalah mahakarya kuliner. Kulitnya yang renyah dan dagingnya yang gurih menyatukan cita rasa yang luar biasa. Kakap dengan mudah menyesuaikan diri dengan berbagai bumbu dan metode memasak, membuatnya menjadi bahan yang serba guna dalam kreasi kuliner. Ikan kakap juga kaya akan nutrisi, seperti protein berkualitas tinggi, asam lemak omega-3, dan berbagai vitamin. Dalam setiap gigitannya, ikan kakap menghadirkan sensasi laut yang istimewa, menjadikannya pilihan sempurna bagi pencinta makanan laut yang mencari cita rasa eksklusif dan kenikmatan yang tak terlupakan.'),
    Product(
        name: "Kepiting",
        price: 100000,
        imagePath: 'lib/images/kepiting.png',
        rating: '4.5',
        isBestSeller: true,
        description: 'Kepiting adalah makanan laut yang memikat dengan rasa lezat dan tekstur uniknya. Daging kepiting segar memiliki cita rasa manis, gurih, dan sedikit garam alami, membuatnya menjadi sajian yang memanjakan lidah. Dapat diolah dalam berbagai masakan, dari kepiting goreng hingga saus lada hitam yang kaya rasa. Selain kelezatan, kepiting juga dikenal karena kandungan protein tinggi, rendah lemak, dan kaya nutrisi seperti selenium dan asam omega-3. Dengan kombinasi ini, kepiting bukan hanya hidangan lezat, tapi juga pilihan sehat. Jadi, jangan lewatkan kesempatan untuk menikmati hidangan laut yang istimewa ini yang akan memikat selera Anda.'),
    Product(
        name: "Cumi-cumi",
        price: 75000,
        imagePath: 'lib/images/cumi-cumi-2.png',
        rating: '4.0',
        isBestSeller: false,
        description: 'Cumi-cumi, hadir dengan cita rasa laut yang elegan, adalah bintang tersembunyi di dunia kuliner. Dagingnya yang lunak dan lezat memiliki kemampuan menyerap rasa dengan sempurna, menjadikannya kanvas ideal untuk kreasi kuliner yang tak terbatas. Cumi-cumi segar menghadirkan rasa ringan dengan sentuhan manis, dan dengan cepat beradaptasi dengan berbagai masakan. Ini adalah pilihan sempurna bagi pecinta makanan laut yang mencari kelezatan yang lezat dan sehat, karena kaya akan protein berkualitas tinggi, rendah lemak, serta nutrisi penting. Bergabunglah dalam petualangan rasa laut yang eksklusif dengan cumi-cumi, yang akan memikat lidah Anda dengan setiap gigitannya.'),
    Product(
        name: "Lobster",
        price: 300000,
        imagePath: 'lib/images/lobster-2.png',
        rating: '5.0',
        isBestSeller: false,
        description: 'Lobster adalah simbol kemewahan di dunia kuliner. Dagingnya yang lembut dan manis, ditemukan di perairan dalam, menghadirkan pengalaman makan yang istimewa. Dengan warna merah cerah yang menggoda, lobster adalah hidangan yang mengundang selera. Citarasa lautnya yang unik, dipadu dengan mentega lezat atau saus rempah, menciptakan kenikmatan yang tak terlupakan. Lobster juga merupakan sumber protein berkualitas tinggi dan rendah lemak, menjadikannya pilihan sehat. Dalam hidangan mewah ini, Anda akan menemukan kelezatan yang tak tertandingi, menjadikannya pilihan ideal bagi mereka yang menginginkan pengalaman kuliner yang istimewa dan tak terlupakan.'),
  ];

  void navigateToProductDetail(index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductDetailPage(
          product: products[index],
        )));
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
          "List Products",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get 50% Promo",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 25),
                    Button(
                        text: "Detail",
                        onTap: () {
                          //
                        })
                  ],
                ),
                Image.asset(
                  'lib/images/fish.png',
                  height: 100,
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "search here..."),
            ),
          ),

          const SizedBox(height: 25),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Products",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) => ProductTile(
                product: products[index],
                onTap: () => navigateToProductDetail(index),
              ),
            ),
            // child: FirebaseAnimatedList(query: ref, itemBuilder: (context, snapshot, animation, index) {
            //   return ListTile(
            //     title: Text(snapshot.child('name').toString()),
            //   );
            // }),
          ),

          const SizedBox(height: 25),

          GestureDetector(
            onTap: () => {
              navigateToProductDetail(1)
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100]),
              margin: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/images/kepiting.png', height: 60),
                      const SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Kepiting",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 2,
                            ).format(100000),
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Colors.grey,
                    size: 28,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}