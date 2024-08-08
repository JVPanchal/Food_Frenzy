import 'package:flutter/material.dart';
import 'package:food_frenzy_1/utils/product_list.dart';
import 'package:google_fonts/google_fonts.dart';

class SoftdrinkScreen extends StatefulWidget {
  const SoftdrinkScreen({super.key});

  @override
  State<SoftdrinkScreen> createState() => _SoftdrinkScreenState();
}

class _SoftdrinkScreenState extends State<SoftdrinkScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("burger");
          },
          icon: const Icon(Icons.arrow_back_ios),
          padding: const EdgeInsets.all(8.0),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.pink, Colors.purple, Colors.blue],
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          child: Text(
            "Find Your Favourite Softdrink",
            style: GoogleFonts.dancingScript(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("cart");
            },
            icon: const Icon(Icons.shopping_cart),
            padding: const EdgeInsets.all(8.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: List.generate(productlistsoftdrink.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushNamed("detailsoftdrink");
                              currentIndex = index;
                            });
                          },
                          child: productBox(
                            context, // Pass context to productBox
                            productlistsoftdrink[index]["img"],
                            productlistsoftdrink[index]["name"],
                            productlistsoftdrink[index]["price"],
                            productlistsoftdrink[index]["details"],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int currentIndex = 0;

Widget productBox(BuildContext context, String i, String n, String p, String d) {
  final mediaQuery = MediaQuery.of(context);
  final screenHeight = mediaQuery.size.height;
  final screenWidth = mediaQuery.size.width;

  return Container(
    height: screenHeight * 0.6, // Dynamic height
    width: screenWidth * 0.9,  // Dynamic width
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: styledProductImage(context, i),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(n, style: GoogleFonts.gupter(fontSize: 17)),
                Text("Details: \n$d", style: GoogleFonts.gupter(fontSize: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price: Rs $p", style: GoogleFonts.gupter(fontSize: 25)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget styledProductImage(BuildContext context, String imagePath) {
  final mediaQuery = MediaQuery.of(context);
  final screenHeight = mediaQuery.size.height;
  final screenWidth = mediaQuery.size.width;

  return Container(
    height: screenHeight * 0.3, // Dynamic height
    width: screenWidth * 0.8,  // Dynamic width
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Subtle shadow
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15), // Ensure image fits the rounded corners
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    ),
  );
}
