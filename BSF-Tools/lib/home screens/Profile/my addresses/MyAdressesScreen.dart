import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/Profile/my%20addresses/edit_address.dart';
import 'package:flutter/material.dart';

class MyAddressesScreen extends StatelessWidget {
  const MyAddressesScreen({super.key});

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
          "My addresses",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _buildAddressTile(context, "Home", "Home", "123, ABC, XYZ Newyork"),
            const Divider(color: AppColors.dividergrey, thickness: 0.5),
            _buildAddressTile(
              context,
              "Work",
              "Office",
              "123, ABC, XYZ Newyork",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressTile(
    BuildContext context,
    String title,
    String subtitle,
    String address,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  address,
                  style: const TextStyle(color: AppColors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditAddressScreen(),
                ),
              );
            },
            icon: const Icon(Icons.edit, color: AppColors.white, size: 24),
          ),
        ],
      ),
    );
  }
}
