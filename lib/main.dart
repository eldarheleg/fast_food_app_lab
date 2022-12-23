import 'package:fast_food_app_lab/city.dart';
import 'package:fast_food_app_lab/food.dart';
import 'package:fast_food_app_lab/widgets/basic_text.dart';
import 'package:fast_food_app_lab/widgets/list_of_meals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool isOff = false;
  List<Food> meals = [
    Food(
        name: "Burger",
        url: "assets/jelo1.png",
        price: 10,
        calories: 250,
        controller: TextEditingController()),
    Food(
        name: "Pizza",
        url: "assets/jelo2.png",
        price: 20,
        calories: 350,
        controller: TextEditingController()),
    Food(
        name: "Rolls",
        url: "assets/jelo3.png",
        price: 30,
        calories: 450,
        controller: TextEditingController()),
    Food(
        name: "Soup",
        url: "assets/jelo4.png",
        price: 40,
        calories: 150,
        controller: TextEditingController()),
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
      child: GestureDetector(
        onTap: () {},
        child: Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("assets/Reklama.png"),
                const BasicText(
                  text: "Zaista Brzo",
                  textStyle: TextStyle(fontSize: 22),
                ),
                const Positioned(
                  top: 20,
                  child: BasicText(
                    text: "Narucivanje i dostava hrane",
                    textStyle: TextStyle(fontSize: 32),
                  ),
                ),
                Positioned(
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
                ),
                Positioned(
                  bottom: 50,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.green),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/zvjezda.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Text("Dostava"),
                                Image.asset(
                                  "assets/zvjezda.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                            Text("20 mins - Besplatna dostava iznad 15 KM"),
                            Switch(
                                value: isOff,
                                onChanged: (value) {
                                  setState(() {
                                    isOff = value;
                                  });
                                })
                          ],
                        ),
                      ),
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
