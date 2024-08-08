import 'package:flutter/material.dart';
import 'Screens/payment_process_screen/cart_screen.dart';
import 'Screens/item_detail_Screens/detail_screen_burger.dart';
import 'Screens/item_Screens/home_screen.dart';
import 'Screens/splash_screen.dart';
import 'Screens/item_Screens/pizza_screen.dart';
import 'Screens/item_Screens/bugger_screen.dart';
import 'Screens/item_Screens/softdrink_screen.dart';
import 'Screens/item_detail_Screens/detail_screen_pizza.dart';
import 'Screens/item_detail_Screens/detail_screen_home.dart';
import 'Screens/item_detail_Screens/detail_screen_softdrink.dart';
import 'Screens/payment_process_screen/bill_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/":(context)=> SplashScreen(),
          "home":(context)=>const HomeScreen(),
          "cart":(context)=>const CartScreen(),
          "pizza":(context)=>const PizzaScreen(),
          "burger":(context)=>const BuggerScreen(),
          "softdrink":(context)=>const SoftdrinkScreen(),
          "homedetail":(context)=>const DetailScreenHome(),
          "detailburger":(context)=>const DetailScreenBurger(),
          "detailpizza":(context)=>const DetailScreenPizza(),
          "detailsoftdrink":(context)=>const DetailScreenSoftdrink(),
          "billscreen":(context)=>const BillScreen()
        },
      ),
    );
  }
}