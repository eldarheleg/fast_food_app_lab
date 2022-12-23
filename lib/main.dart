import 'package:fast_food_app_lab/city.dart';
import 'package:fast_food_app_lab/food.dart';
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
  final controller1 = TextEditingController();
  List<Food> meals = [
    Food(name: "Burger", url: "assets/jelo1.png", price: 10, calories: 250, controller: TextEditingController()),
    Food(name: "Pizza", url: "assets/jelo2.png", price: 20, calories: 350,controller: TextEditingController()),
    Food(name: "Rolls", url: "assets/jelo3.png", price: 30, calories: 450,controller: TextEditingController()),
    Food(name: "Soup", url: "assets/jelo4.png", price: 40, calories: 150,controller: TextEditingController()),
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
        onTap: (){},
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
                              topRight: Radius.circular(20),),
                          color: Colors.white),
                      child: Center(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 50,
                          ),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(vertical: 20),
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
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Image.asset(
                        //       "assets/jelo1.png",
                        //       height: 30,
                        //       width: 30,
                        //     ),
                        //     Text("burger"),
                        //     VerticalDivider(),
                        //     Text("15"),
                        //     Icon(Icons.check_circle_outlined),
                        //     Container(
                        //       child: TextField(
                        //         readOnly: true,
                        //       ),
                        //       height: 30,
                        //       width: 30,
                        //     ),
                        //     CircleAvatar(
                        //       child: Text("233"),
                        //     ),
                        //     Text("calories"),
                        //   ],
                        // )
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
