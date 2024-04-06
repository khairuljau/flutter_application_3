import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  
  final Function()? onTap;
  
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFFF2B400),
          borderRadius: BorderRadius.circular(15),
          ),
        child: const Center(
          child: Text("Log In",
            style: TextStyle(
              color: Color(0xFF37474F),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              ),
            ),
          ),
      ),
    );
  }
}