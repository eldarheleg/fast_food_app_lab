import 'package:fast_food_app_lab/city.dart';
import 'package:fast_food_app_lab/food.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Food> meals = [
    Food(name: "Burger", url: "assets/jelo1.png", price: 10, calories: 250),
    Food(name: "Pizza", url: "assets/jelo2.png", price: 20, calories: 350),
    Food(name: "Rolls", url: "assets/jelo3.png", price: 30, calories: 450),
    Food(name: "Soup", url: "assets/jelo4.png", price: 40, calories: 150),
  ];
  List<City> cities = [
    City(name: "Centar", distance: 1),
    City(name: "Blatusa", distance: 2),
    City(name: "Radakovo", distance: 3),
    City(name: "Crkvice", distance: 4),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              fit: StackFit.loose,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/Reklama.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Positioned(
                    top: 0,
                    child: Column(
                      children: const [
                        BasicText(
                          text: "ZAISTA BRZO",
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        BasicText(
                          text: "Narucivanje i dostava hrane",
                          textStyle: TextStyle(fontSize: 34),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  child: Expanded(
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BasicText extends StatelessWidget {
  const BasicText({Key? key, required this.text, required this.textStyle})
      : super(key: key);
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
