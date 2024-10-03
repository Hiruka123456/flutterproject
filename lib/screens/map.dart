import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_example/screens/profile_screen.dart';
import '';
import '../widgets/BottomNavigationBar.dart';
import 'home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  LatLng? _userLocation;
  int _selectedIndex = 1;


  @override
  void initState() {
    super.initState();
    _getUserLocation();


  }
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

    } else if (index == 0) { // Index 0 is for Profile
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );

    } // Set initial index to Home
  }
  Future<void> _getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle permission denied case
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });

    _controller?.animateCamera(CameraUpdate.newLatLng(_userLocation!));
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map View"),
      ),
      body: _userLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _userLocation!,
          zoom: 14.0,
        ),
        myLocationEnabled: true, // Show user's location
        markers: {
          Marker(
            markerId: const MarkerId('userLocation'),
            position: _userLocation!,
            infoWindow: const InfoWindow(title: 'Your Location'),
          ),
        },
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
