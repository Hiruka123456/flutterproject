import 'package:flutter/material.dart';
import 'package:shop_example/screens/home_screen.dart';
import 'package:shop_example/theme/theme.dart'; // Adjust the path if necessary
import 'package:shop_example/widgets/custom_scaffold.dart';
import 'package:shop_example/screens/map.dart'; // Adjust the path if necessary
import 'package:shop_example/screens/cart_screen.dart'; // Adjust the path if necessary

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentSlide = 0;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the current index
    });

    if (index == 1) { // Index 1 is for Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
    else if (index == 2) {  // Index 2 is for Cart
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CartScreen()),
      );

    } else if (index == 3) { // Index 3 is for Map
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (
            context) => const MapScreen()), // Navigate to the MapScreen
      );
    } // Set initial index to Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Wrap the content in SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                      'https://www.example.com/profile_image.png', // Replace with a valid image URL
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Full Name: John Doe', // Replace with actual user name
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Email: johndoe@example.com', // Replace with actual email
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement edit profile functionality
                    },
                    child: const Text('Edit Profile'),
                  ),
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
