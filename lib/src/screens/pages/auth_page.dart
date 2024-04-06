// Importing necessary packages/modules
import 'package:firebase_auth/firebase_auth.dart'; // For Firebase Authentication
import 'package:flutter/material.dart'; // For building UI components
import 'package:flutter_application_3/src/screens/pages/home_page.dart'; // Importing Home Page
import 'package:flutter_application_3/src/screens/pages/login_page.dart'; // Importing Login Page

// Defining a StatelessWidget for Authentication Page
class AuthPage extends StatelessWidget {
  // Constructor for AuthPage
  const AuthPage({super.key});

  // Build method to create the UI of AuthPage
  @override
  Widget build(BuildContext context) {
    // Returning a Scaffold widget with a StreamBuilder
    return Scaffold(
      // Scaffold body contains StreamBuilder
      body: StreamBuilder<User?>(
        // Stream listens for changes in authentication state using FirebaseAuth
        stream: FirebaseAuth.instance.authStateChanges(),
        // Builder function gets called whenever there's a change in authentication state
        builder: (context, snapshot) {
          // Check if user is logged in
          if (snapshot.hasData) {
            // If user is logged in, navigate to HomePage
            return HomePage();
          } 
          // User is not logged in
          else {
            // Show LoginPage
            return const LoginPage();
          }
        },
      ),
    );
  }
}
