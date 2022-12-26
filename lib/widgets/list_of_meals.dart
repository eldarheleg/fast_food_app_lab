import 'package:fast_food_app_lab/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListOfMeals extends StatelessWidget {
  const ListOfMeals({
    Key? key,
    required this.meals,
  }) : super(key: key);

  final List<Food> meals;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (context, index) => SizedBox(
          width: 50,
        ),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 30),
        shrinkWrap: true,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                meals[index].url,
                height: 30,
                width: 30,
              ),
              Text(meals[index].name),
              Container(
                height: 10,
                width: 2,
                color: Colors.amber,
              ),
              Text(meals[index].price.toInt().toString()),
              Icon(Icons.check_circle_outlined),
              Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(border: OutlineInputBorder(),contentPadding: EdgeInsets.zero),
                    controller: meals[index].controller,
                  ),
                  height: 30,
                  width: 40,
                ),
              
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 240, 165, 26),
                child: Text(
                    meals[index].calories.toInt().toString(), style: TextStyle(color: Colors.white),),
              ),
              Text("calories"),
            ],
          );
        },
    );
  }
}