import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/admin/analytics/Analytics.dart';
import 'package:bsf/admin/dashboard%20overview/DashboardOverview.dart';
import 'package:bsf/admin/discounts/Discounts.dart';
import 'package:bsf/admin/payments/Payments.dart';
import 'package:bsf/admin/product%20management/ProductManagement.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

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
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello, John",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Dashboard Overview (Full Width)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardOverviewScreen(),
                      ),
                    );
                    // Handle tap
                  },
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColors.textfieldcolor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.textGrey),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.dashboard_customize,
                            size: 30,
                            color: AppColors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Dashboard overview",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Grid of Remaining Buttons (2x2)
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                    children: [
                      _buildTile(
                        Icons.add_circle_outline,
                        "Product\nmanagement",
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductManagementScreen(),
                            ),
                          );
                        },
                      ),
                      _buildTile(Icons.discount, "Discounts", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiscountsScreen(),
                          ),
                        );
                      }),
                      _buildTile(Icons.receipt_long, "Payment", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentsScreen(),
                          ),
                        );
                      }),
                      _buildTile(Icons.analytics, "Analytic", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnalyticsScreen(),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],

        /*decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8B0000), // Deep red
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),*/
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.redcolor,
        unselectedItemColor: AppColors.white,
        currentIndex: 2, // Admin selected
        onTap: (index) {
          // Handle navigation logic
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.percent), label: "Offers"),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Products",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Admin"),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textfieldcolor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.textGrey),
        ),
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: AppColors.white),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.white, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
