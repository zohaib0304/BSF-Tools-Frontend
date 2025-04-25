import 'package:bsf/App%20Colors/colors.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/icons/loginbackground.png',
              fit: BoxFit.cover,
            ),
          ),
          // Background Gradient Effect
          /*Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8B0000), // Dark Red
                  Colors.black,
                ],
              ),
            ),
          ),*/

          // Center Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check, color: AppColors.white, size: 60),
                const SizedBox(height: 16),
                const Text(
                  "Your order has been placed.",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enjoy your purchases!",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Close Button (Top-Right)
          Positioned(
            top: 50, // Adjust for safe area
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: AppColors.white, size: 28),
              onPressed: () {
                Navigator.pop(context); // Close the screen
              },
            ),
          ),
        ],
      ),
    );
  }
}
