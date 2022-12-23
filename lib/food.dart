import 'package:flutter/material.dart';

class Food {
  final String name;
  final String url;
  final double price;
  final double calories;
  final TextEditingController controller;

  Food(
      {required this.name,
      required this.url,
      required this.price,
      required this.calories,
      required this.controller});

  getBasePrice(double p) {
    return this.price * p;
  }
}
