import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/src/screens/pages/home_page.dart';
import 'package:flutter_application_3/src/screens/pages/login_page.dart';
import 'package:flutter_application_3/src/screens/pages/road_assist/road_assist_home.dart';

class RoadAssistPage extends StatelessWidget {
  const RoadAssistPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check authentication state
    final user = FirebaseAuth.instance.currentUser;

    // back to homepage method with navigation logic
    void backToHome(BuildContext context) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false, // This will remove all routes from the stack
      );
    }

    return Scaffold(
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
      backgroundColor: const Color(0xFFD9D9D9),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/road_assist.png',
                height: 250,
              ),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Color(0xFF37474F)),
                    children: [
                      TextSpan(
                        text: "Need help on the road? ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            "Report car problems and get assistance easily. Our road assistance app is here to help you.",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              user != null
                  ? ElevatedButton(
                      onPressed: () {
                        // Navigate to RoadAssistHome
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoadAssistHome(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF2B400),
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Get Assistance",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        // Navigate to LoginPage if user is not authenticated
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF2B400),
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Login to Get Assistance",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
