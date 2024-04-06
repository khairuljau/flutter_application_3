import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/src/components/custom_tile_two.dart';
import 'package:flutter_application_3/src/screens/pages/home_page.dart';

class RoadAssistHome extends StatelessWidget {
  const RoadAssistHome({super.key}); // Constructor declaration

  @override
  Widget build(BuildContext context) {
    // Get the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    // back to homepage method with navigation logic
    void backToHome(BuildContext context) {
      // Navigate back to the HomePage and remove all routes from the stack
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false, // This will remove all routes from the stack
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9), // Background color for the scaffold
      appBar: AppBar(
        title: const Text("Road Assistance"), // App bar title
        centerTitle: true, // Center align title
        backgroundColor: const Color(0xFFF2B400), // App bar background color
        actions: [
          IconButton(
            onPressed: () => backToHome(context), // Navigate back to home page when pressed
            icon: const Icon(Icons.home), // Home icon button
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "How can we assist you?", // Text asking for user assistance
              style: TextStyle(
                fontSize: 20, // Font size
                fontWeight: FontWeight.bold, // Bold font weight
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Logged in as: ${user?.email ?? 'Unknown'}", // Display user email or 'Unknown' if not available
              style: const TextStyle(
                fontSize: 16, // Font size
                color: Colors.grey, // Text color
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3, // Two tiles in each row
              children: [
                // Use CustomTile for each tile
                CustomTile(
                  title: 'Dead Battery', // Tile title
                  imagePath: 'assets/images/dead_battery.png', // Tile image path
                  color: Colors.white, // Tile color
                  onTap: () {
                    // Implement your Car Management functionality here
                  },
                ),

                CustomTile(
                  title: 'Broke Down', // Tile title
                  imagePath: 'assets/images/broke_down.png', // Tile image path
                  color: Colors.white, // Tile color
                  onTap: () {
                    // Implement your Car Management functionality here
                  },
                ),

                CustomTile(
                  title: 'Flat Tire', // Tile title
                  imagePath: 'assets/images/flat_tire.png', // Tile image path
                  color: Colors.white, // Tile color
                  onTap: () {
                    // Implement your Car Management functionality here
                  },
                ),

                CustomTile(
                  title: 'Locked Out', // Tile title
                  imagePath: 'assets/images/locked_out.png', // Tile image path
                  color: Colors.white, // Tile color
                  onTap: () {
                    // Implement your Car Management functionality here
                  },
                ),

                CustomTile(
                  title: 'Out of Gas', // Tile title
                  imagePath: 'assets/images/out_gas.png', // Tile image path
                  color: Colors.white, // Tile color
                  onTap: () {
                    // Implement your Car Management functionality here
                  },
                ),

                CustomTile(
                  title: 'Request a Mechanic', // Tile title
                  imagePath: 'assets/images/alarm.png', // Tile image path
                  color: Colors.white, // Tile color
                  onTap: () {
                    // Implement your Car Management functionality here
                  },
                ),
                // Repeat CustomTile for other functionalities...
              ],
            ),
          ),
        ],
      ),
    );
  }
}
