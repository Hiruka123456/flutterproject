import 'package:flutter/material.dart';
import 'package:shop_example/constants.dart';
import 'package:shop_example/models/product.dart';
import 'package:shop_example/widgets/categories.dart';
import 'package:shop_example/widgets/home_slider.dart';
import 'package:shop_example/widgets/product_card.dart';
import 'package:shop_example/widgets/search_field.dart';
import 'package:shop_example/screens/map.dart'; // Import the MapScreen
import 'package:shop_example/screens/profile_screen.dart'; // Import the ProfileScreen
import 'package:shop_example/screens/cart_screen.dart'; // Import the CartScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlide = 0;
  int _selectedIndex = 1; // Set initial index to Home

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the current index
    });

    if (index == 0) { // Index 0 is for Profile
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else if (index == 2) {  // Index 2 is for Cart
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CartScreen()),
      );
    } else if (index == 3) { // Index 3 is for Map
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()), // Navigate to the MapScreen
      );
    }
  }

  // Block back navigation
  Future<bool> _onWillPop() async {
    // Return `false` to block the back button
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // Block back navigation

        backgroundColor: kscaffoldColor,

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SearchField(),
                  const SizedBox(height: 20),
                  HomeSlider(
                    onChange: (value) {
                      setState(() {
                        currentSlide = value;
                      });
                    },
                    currentSlide: currentSlide,
                  ),
                  const SizedBox(height: 20),
                  const Categories(),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Special For You",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("See all"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile icon
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // Cart icon
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map), // Map icon
            label: 'Map', // Label for the Map icon
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Set color for selected item
        unselectedItemColor: Colors.grey, // Set color for unselected items
        backgroundColor: Colors.white, // Set background color of the navigation bar
        onTap: _onItemTapped, // Handle taps on the bottom navigation bar
      ),
      );
  }
}
