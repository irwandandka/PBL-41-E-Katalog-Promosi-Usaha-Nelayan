import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katalog_usaha_nelayan/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            const Text(
              "Katalog Usaha Nelayan",
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/fishing-boat.png'),
            ),

            const SizedBox(height: 25)
,
            const Text(
              "Ragam Biota Laut yang Fresh dari Laut yang Kita Cintai",
              style: TextStyle(
              // style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Produk laut Segar dengan Kualitas Terbaik!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 25),

            Button(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/list');
              },
            )
          ],
        ),
      ),
    );
  }
}