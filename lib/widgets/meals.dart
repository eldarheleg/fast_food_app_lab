import 'package:fast_food_app_lab/food.dart';
import 'package:fast_food_app_lab/widgets/list_of_meals.dart';
import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  const Meals({
    Key? key,
    required this.meals,
  }) : super(key: key);

  final List<Food> meals;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 350,
      child: SingleChildScrollView(
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white),
          child: Center(
            child: ListOfMeals(meals: meals),
          ),
        ),
      ),
    );
  }
}