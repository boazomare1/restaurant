import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
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
  //customer cart
  List<Food> _cart = [];

  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
