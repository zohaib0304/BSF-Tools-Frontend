import 'package:bsf/App%20Colors/colors.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          "My orders",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10, // Space between columns
            mainAxisSpacing: 10, // Space between rows
            childAspectRatio: 0.75, // Adjust height of grid items
          ),
          itemCount: 6, // Change to your desired number of items
          itemBuilder: (context, index) {
            return _buildOrderItem();
          },
        ),
      ),
    );
  }

  Widget _buildOrderItem() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey, // Dark grey card
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/icons/product.png", // Load image from assets
                width: double.infinity,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Product Name
          const Text(
            "Glass defrosting spray...",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),

          // Order Date
          const Text(
            "March 21, 2025",
            style: TextStyle(color: AppColors.lightwhite, fontSize: 12),
          ),

          // Price
          const Text(
            "230.00 RSD",
            style: TextStyle(
              color: AppColors.lessred,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
