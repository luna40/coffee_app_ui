import 'package:coffee_app_ui/screens/coffee_tile.dart';
import 'package:coffee_app_ui/screens/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffeeType
  final List coffeeType = [
    ['Cappuccino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(
        children: [
          Text(
            'Find The Best Coffee For you' ,
            style: GoogleFonts.merriweather(fontSize: 46, fontWeight: FontWeight.bold,),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
           Container(
            height: 50,
            child: ListView.builder(
              itemCount: coffeeType.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    });
              },
            ),
          ),

          // Horizontal listview of coffee tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(
                coffeeImagePath: 'assets/americano.jpg',
                coffeeName: 'Latte',
                coffeePrice: '4.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/cappuchino.jpg',
                coffeeName: 'Cappuccino',
                coffeePrice: '4.10',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/latte.jpg',
                coffeeName: 'Milk Coffee',
                coffeePrice: '4.60',
              ),
            ],
          ))
        ],
      ),
    );
  }
}