import 'package:flutter/material.dart';
import 'package:shop_example/constants.dart';
import 'package:shop_example/models/cart_item.dart';
import 'package:shop_example/widgets/cart_tile.dart';
import 'package:shop_example/widgets/check_out_box.dart';
import 'package:shop_example/screens/home_screen.dart';
import 'package:shop_example/screens/profile_screen.dart';
import 'package:shop_example/screens/map.dart'; // Import the new MapScreen

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 2; // Set index 2 for the cart screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the current index
    });

    if (index == 0) { // Index 0 is for Profile
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else if (index == 1) { // Index 1 is for Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 3) { // Index 3 is for Map
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()), // Navigate to the MapScreen
      );
    }
    // Index 2 (Cart) is already here; do nothing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomSheet: CheckOutBox(
        items: cartItems,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                shrinkWrap: true, // Allow ListView to take only the space it needs
                itemBuilder: (context, index) => CartTile(
                  item: cartItems[index],
                  onRemove: () {
                    if (cartItems[index].quantity != 1) {
                      setState(() {
                        cartItems[index].quantity--;
                      });
                    }
                  },
                  onAdd: () {
                    setState(() {
                      cartItems[index].quantity++;
                    });
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemCount: cartItems.length,
              ),
            ],
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
