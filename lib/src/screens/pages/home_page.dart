import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/src/components/custom_tile.dart';
import 'package:flutter_application_3/src/screens/pages/auth_page.dart';
import 'package:flutter_application_3/src/screens/pages/road_assist/road_assist_page.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // After signing out, navigate to the AuthPage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        title: const Text("PIASAU"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF2B400), // Adjust color as needed
        actions: [
          IconButton(
            onPressed: () => signUserOut(context), // Pass context here
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFD9D9D9), // Set the desired background color here
          
        ),
        child: GridView.count(
          crossAxisCount: 2, // Two tiles in each row
          children: [
            // Use CustomTile for each tile
            CustomTile(
              title: 'Car Management',
              imagePath: 'assets/images/car_management.png', // Provide the correct path
              color: Colors.white,
              onTap: () {
                // Implement your Car Management functionality here
              },
            ),
            CustomTile(
              title: 'Car Details',
              imagePath: 'assets/images/car_details.png', // Provide the correct path
              color: Colors.white,
              onTap: () {
                // Implement your Car Management functionality here
              },
            ),
            CustomTile(
              title: 'Services Center',
              imagePath: 'assets/images/services_center.png', // Provide the correct path
              color: Colors.white,
              onTap: () {
                // Implement your Car Management functionality here
              },
            ),
            CustomTile(
              title: 'Road Assistance',
              imagePath: 'assets/images/road_assistance.png', // Provide the correct path
              color: Colors.white,
                onTap: () {
                  // Navigate to the RoadAssistancePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RoadAssistPage()),
                  );
                },
            ),
            CustomTile(
              title: 'User Profile',
              imagePath: 'assets/images/user_profile.png', // Provide the correct path
              color: Colors.white,
              onTap: () {
                // Implement your Car Management functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}