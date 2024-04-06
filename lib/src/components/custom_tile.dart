import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title; // Text displayed on the tile
  final String imagePath; // Path to the image asset
  final Color color; // Background color of the tile
  final VoidCallback onTap; // Function to be called when the tile is tapped
  final double height; // Height of the tile (optional)
  final double width; // Width of the tile (optional)

  const CustomTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
    required this.onTap,
    this.height = 100.0, // Default height
    this.width = 100.0,  // Default width
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          color: color,
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0), // Adjust padding as desired
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center images and text
              children: [
                Image.asset(
                  imagePath,
                  height: height * 1.0, // Adjust image height based on tile height
                  width: width * 1.0, // Adjust image width based on tile width
                ),
                Text(title, style: const TextStyle(color: Color(0xFF0F4C82))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







