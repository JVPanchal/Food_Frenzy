import 'package:flutter/material.dart';
import 'package:food_frenzy_1/Screens/item_Screens/bugger_screen.dart';
import 'package:food_frenzy_1/utils/product_list.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreenPizza extends StatefulWidget {
  const DetailScreenPizza({super.key});

  @override
  State<DetailScreenPizza> createState() => _DetailScreenPizzaState();
}

class _DetailScreenPizzaState extends State<DetailScreenPizza> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed("pizza");
        },
        icon: const Icon(Icons.arrow_back_ios),
        padding:const EdgeInsets.all(8.0), 
      ),
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.pink, Colors.purple, Colors.blue],
          tileMode: TileMode.mirror,
        ).createShader(bounds),
        child: Text(
          "Find Your Favourite Pizza",
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
          icon:const Icon(Icons.shopping_cart),
          padding:const  EdgeInsets.all(8.0), // Add some padding for better spacing
        ),
      ],
    ),      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    productlistpizza[currentIndex]["img"],
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  productlistpizza[currentIndex]["name"],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.details, color: Colors.grey),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        productlistpizza[currentIndex]["details"],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                'Rs: ${productlistburger[currentIndex]["price"]}',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    cartList.add(productlistpizza[currentIndex]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
