import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/food_tile.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/pages/food_details.dart';
import 'package:sushi/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    //salmon sushi
    Food(
        name: 'Salmon Sushi',
        description:
            'Sake Nigiri - Raw salmon. Hotate Nigiri - Fresh raw scallop. Maguro Nigiri - Raw tuna.',
        price: "21.00",
        imagePath: 'assets/images/salmon_sushi.png',
        rating: '4.9'),
    //sushi roll
    Food(
        name: 'Sushi Roll',
        description: 'rolsnssls sl sl',
        price: "15.00",
        imagePath: 'assets/images/sushi_roll.png',
        rating: '4.3'),
    //tuna
    Food(
        name: 'Tuna',
        price: "8.00",
        description: 'vkjslsbl',
        imagePath: 'assets/images/tuna.png',
        rating: '4.2'),
  ];

  //navigate to food item details
  void navigateToFoodDetails(int index) {
    //get shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetails(
                  food: foodMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    //get shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        leading: const Icon(
          Icons.menu,
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          //cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //promo message
                      Text(
                        'Get 32% Promo',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //redeem button
                      MyButton(buttonText: 'Redeem', onTap: () {})
                    ],
                  ),
                  //image
                  Image.asset(
                    'assets/images/many_sushi.png',
                    height: 100,
                  ),
                ]),
          ),
          const SizedBox(
            height: 25,
          ),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Search Here..',
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: primaryColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
            )),
          ),
          const SizedBox(
            height: 25,
          ),

          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //popular food
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                      food: foodMenu[index],
                      onTap: () => navigateToFoodDetails(index),
                    )),
          )),
          const SizedBox(
            height: 25,
          ),
          //popular food

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image
                Row(
                  children: [
                    Image.asset(
                      'assets/images/salmon_egg.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          'Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //price
                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
                //heart
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey[900],
                  size: 29,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
