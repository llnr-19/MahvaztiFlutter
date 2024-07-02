import 'package:flutter/material.dart';

class Category {
  final String categoryName;
  // ignore: prefer_typing_uninitialized_variables
  final IconData icon;
  Category({required this.categoryName, required this.icon});
}

List<Category> categories = [
  Category(categoryName: "Financial Card", icon: Icons.wallet),
  Category(categoryName: "Access Card", icon: Icons.door_sliding),
  Category(categoryName: "Transportation Card", icon: Icons.train),
];

class MyCardDetails {
  final String cardNumber;
  final String cardHolderName;
  final String cardType;

  MyCardDetails({
    required this.cardNumber,
    required this.cardHolderName,
    required this.cardType,
  });

  Map<String, String> toJson() {
    return {
      'card_number': cardNumber,
      'card_holder_name': cardHolderName,
      'card_type': cardType,
    };
  }
}
