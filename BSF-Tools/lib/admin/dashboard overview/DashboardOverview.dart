import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/admin/dashboard%20overview/NewCustomers.dart';
import 'package:bsf/admin/dashboard%20overview/Sales.dart';
import 'package:flutter/material.dart';

class DashboardOverviewScreen extends StatelessWidget {
  const DashboardOverviewScreen({super.key});

  Widget buildInfoRow(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.textfieldcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: AppColors.textGrey)),
          Text(value, style: TextStyle(color: AppColors.white)),
        ],
      ),
    );
  }

  Widget buildSection(
    String title,
    List<Map<String, String>> data, {
    bool showViewAll = true,
    VoidCallback? onViewAllPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containercolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          ...data.map((item) => buildInfoRow(item['label']!, item['value']!)),
          if (showViewAll)
            Center(
              child: TextButton(
                onPressed: onViewAllPressed,
                child: Text.rich(
                  TextSpan(
                    text: "View all",
                    style: TextStyle(
                      color: AppColors.white,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          AppColors.white, // 👈 Your underline color here
                      decorationThickness:
                          1.5, // Optional: makes the underline bolder
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, color: AppColors.white),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Dashboard overview",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24), // to balance arrow on left
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    buildSection(
                      "Sales",
                      [
                        {"label": "Total sales / Today", "value": "12"},
                        {"label": "Total sales / This week", "value": "50"},
                        {"label": "Total sales / This month", "value": "800"},
                      ],
                      onViewAllPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SalesScreen()),
                        );
                      },
                    ),
                    buildSection(
                      "New customers",
                      [
                        {"label": "New customers / Today", "value": "12"},
                        {"label": "New customers / This week", "value": "50"},
                        {"label": "New customers / This month", "value": "800"},
                      ],
                      onViewAllPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewCustomersScreen(),
                          ),
                        );
                      },
                    ),
                    buildSection("Orders", [
                      {"label": "Delivered", "value": "12"},
                      {"label": "Dispatched", "value": "50"},
                      {"label": "Returns", "value": "02"},
                    ], showViewAll: false),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
