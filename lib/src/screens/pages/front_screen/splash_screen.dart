// Importing necessary packages/modules
import 'package:flutter/material.dart';
import 'package:flutter_application_3/src/screens/pages/auth_page.dart'; // For building UI components


// Defining a StatelessWidget for Authentication Page
class SplashScreen extends StatelessWidget {
  // Constructor for AuthPage
  SplashScreen({Key? key});

  // Build method to create the UI of AuthPage
  @override
  Widget build(BuildContext context) {
    // Returning a Scaffold widget with a StreamBuilder
    return Scaffold(
      backgroundColor: const Color(0xFFF2B400),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Logo Image
            Image.asset(
              'assets/images/logo.png', // Replace 'assets/logo.png' with your image path
              width: 150, // Set width of the image
              height: 100, // Set height of the image
            ),
            // Logo Image
            Image.asset(
              'assets/images/piasau.png', // Replace 'assets/logo.png' with your image path
              width: 150, // Set width of the image
              height: 100, // Set height of the image
            ),
            const SizedBox(height: 100), // Add some spacing
            ElevatedButton(
              onPressed: () {
                // Navigate to the RoadAssistancePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                );
              },
              child: const Text('Sign In'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 60), // Set the minimum size of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Set the corner radius of the button
                ),
                backgroundColor: const Color(0xFF37474F),
                foregroundColor: Colors.white,
              ),
              
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Create Account page
              },
              child: const Text('Create an account'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 60), // Set the minimum size of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Set the corner radius of the button
                ),
                backgroundColor: const Color(0xFF37474F),
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
