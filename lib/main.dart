import 'package:fast_food_app_lab/city.dart';
import 'package:fast_food_app_lab/food.dart';
import 'package:fast_food_app_lab/widgets/basic_text.dart';
import 'package:fast_food_app_lab/widgets/list_of_meals.dart';
import 'package:fast_food_app_lab/widgets/meals.dart';
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
  String? selected;
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
      top: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                Meals(meals: meals),
                OrderField(context),
                Positioned(
                    bottom: 50,
                    child: Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20)),
                          onPressed: () {
                            meals.forEach((element) {
                              print(element.controller.text);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "NARUCI",
                                style: TextStyle(fontSize: 32),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.shopping_cart_rounded,
                                color: Colors.amber,
                              )
                            ],
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned OrderField(BuildContext context) {
    return Positioned(
      bottom: 140,
      child: SingleChildScrollView(
        child: Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
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
                      Text(
                        "Dostava",
                        style: TextStyle(fontSize: 22),
                      ),
                      Image.asset(
                        "assets/zvjezda.png",
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                  Text("20 mins - Besplatna dostava iznad 15 KM"),
                  SizedBox(
                    height: 30,
                    width: 20,
                    child: Switch(
                      value: isOff,
                      onChanged: (value) {
                        setState(
                          () {
                            isOff = value;
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                children: [
                                  SizedBox(
                                    height: 400,
                                    width: 300,
                                    child: ListView.builder(
                                        itemCount: cities.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Center(
                                            child: ListTile(
                                              onTap: () {
                                                setState(() {
                                                  selected = cities[index].name;
                                                });

                                                Navigator.of(context).pop();
                                                
                                              },
                                              title: Text(cities[index].name),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade400),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search),
                              Text(selected == null
                                  ? "Ulica,Naselje"
                                  : selected!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
