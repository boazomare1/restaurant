import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/themes/colors.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 0;
  //decrement count

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  //increment count
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void addToCart() {
    //only add to cart if there is something in the cart
    if (quantity > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToCart(widget.food, quantity);

      //let the user know it was successful
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            backgroundColor: primaryColor,
                content: const Text(
                  "Successfully Added",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  //okay button
                  IconButton(
                      onPressed: () {
                        //pop once to remove dialog box
                        Navigator.pop(context);

                        //pop again to go previous screen
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listView of Food Details
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                //image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                const SizedBox(
                  height: 25,
                ),
                //rating
                Row(
                  children: [
                    //star
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //rating number
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //food name
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),

                const SizedBox(
                  height: 25,
                ),
                //description
                Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.description,
                  style: TextStyle(
                      height: 2,
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
          // price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price +quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: decrementQuantity),
                        ),

                        //quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        //plus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: incrementQuantity),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //add to cart button
                MyButton(buttonText: 'Add To Cart', onTap: addToCart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
