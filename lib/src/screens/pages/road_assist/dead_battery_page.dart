import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/src/screens/pages/home_page.dart';

class DeadBatteryPage extends StatelessWidget {
  const DeadBatteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check authentication state
    final user = FirebaseAuth.instance.currentUser;

    // back to homepage method with navigation logic
    void backToHome(BuildContext context) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false, // This will remove all routes from the stack
      );
    }


    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        title: const Text("Road Assistance"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF2B400), // Adjust color as needed
        actions: [
          IconButton(
            onPressed: () => backToHome(context), // Pass context to signUserOut
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "How can we assist you?", // Text asking for user assistance
              style: TextStyle(
                fontSize: 20, // Font size
                fontWeight: FontWeight.bold, // Bold font weight
              ),
            ),
          ),
        ],
      ),
    );
  }
}
