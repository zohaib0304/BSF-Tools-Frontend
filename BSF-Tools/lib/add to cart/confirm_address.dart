import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/add%20to%20cart/change_address.dart';
import 'package:bsf/add%20to%20cart/confirm_payment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ConfirmAddressScreen(),
    );
  }
}

class ConfirmAddressScreen extends StatelessWidget {
  const ConfirmAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size; // Get device size for responsiveness

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Address",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Address Fields
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTextField("House number", "123"),
                _buildTextField("Street number", "123"),
                _buildTextField("City", "123"),
                _buildTextField("Postal code", "123"),

                const SizedBox(height: 12),

                // Change Address Button
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeAddressScreen(),
                        ),
                      );
                      // Handle address change
                    },
                    child: const Text(
                      "Change address",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Makes text more visible
                        decoration: TextDecoration.underline, // Adds underline
                        decorationColor:
                            AppColors.white, // Ensures underline is white
                        decorationThickness: 1, // Makes underline thicker
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Total Amount Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Inc. tax",
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ],
                ),
                const Text(
                  "690.00 RSD",
                  style: TextStyle(
                    color: AppColors.lessred,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Confirm Address Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redcolor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmPaymentScreen(),
                    ),
                  );
                  // Handle address confirmation
                },
                child: const Text(
                  "Confirm address",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.redcolor,
        unselectedItemColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // "Offers" tab is active
        onTap: (index) {
          // Handle navigation
        },
        items: const [
          //BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.percent), label: "Offers"),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Products",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Address Input Field Widget
  Widget _buildTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        readOnly: true,
        style: const TextStyle(color: AppColors.white, fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: AppColors.textGrey, fontSize: 14),
          hintText: value,
          hintStyle: const TextStyle(color: AppColors.white, fontSize: 16),
          filled: true,
          fillColor: AppColors.textfieldcolor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
