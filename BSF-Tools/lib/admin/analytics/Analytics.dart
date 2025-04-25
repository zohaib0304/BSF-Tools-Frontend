import 'package:bsf/App%20Colors/colors.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> productList = List.generate(
    4,
    (index) => {
      'title': 'Glass defrosting spray',
      'views': '8000 views',
      'sold': '200 pieces sold',
      'image':
          'assets/icons/product.png', // Make sure to add your image asset here
    },
  );

  AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: AppColors.white),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Analytics',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24), // To balance the back arrow
                ],
              ),
            ),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Most viewed items'),
                    _buildGrid(productList, isTrending: false),
                    _buildSectionTitle('Most viewed items'),
                    _buildGrid(productList, isTrending: false),
                    _buildSectionTitle('Trending products'),
                    _buildGrid(productList, isTrending: true),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGrid(
    List<Map<String, dynamic>> items, {
    required bool isTrending,
  }) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children:
          items.map((item) {
            return Container(
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(item['image'], height: 100),
                  SizedBox(height: 10),
                  Text(
                    item['title'],
                    style: TextStyle(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 16,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 4),
                      Text(
                        isTrending ? item['sold'] : item['views'],
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
