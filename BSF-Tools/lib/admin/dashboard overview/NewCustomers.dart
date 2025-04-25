import 'package:bsf/App%20Colors/colors.dart';
import 'package:flutter/material.dart';

class NewCustomersScreen extends StatelessWidget {
  const NewCustomersScreen({super.key});

  Widget buildCustomersItem(String range, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textfieldcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(range, style: TextStyle(color: AppColors.textGrey)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: AppColors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildMonthSection(String month, List<Map<String, String>> sales) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          month,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        ...sales.map(
          (item) => buildCustomersItem(item['range']!, item['value']!),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildYearSection(
    String year,
    Map<String, List<Map<String, String>>> data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          year,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        ...data.entries.map(
          (entry) => buildMonthSection(entry.key, entry.value),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final salesData = {
      '2025': {
        'March': [
          {'range': 'March 01 - March 10', 'value': '12'},
          {'range': 'March 11 - March 20', 'value': '50'},
          {'range': 'March 21 - March 31', 'value': '200'},
        ],
        'February': [
          {'range': 'February 01 - February 10', 'value': '12'},
          {'range': 'February 11 - February 20', 'value': '50'},
          {'range': 'February 21 - February 28', 'value': '200'},
        ],
        'January': [
          {'range': 'January 01 - January 10', 'value': '12'},
          {'range': 'January 11 - January 20', 'value': '50'},
          {'range': 'January 21 - January 31', 'value': '200'},
        ],
      },
      '2024': {
        'December': [
          {'range': 'December 01 - December 10', 'value': '12'},
          {'range': 'December 11 - December 20', 'value': '50'},
          {'range': 'December 21 - December 31', 'value': '200'},
        ],
      },
    };

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
                        'New customers',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24), // For symmetry with back arrow
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      salesData.entries
                          .map(
                            (entry) => buildYearSection(entry.key, entry.value),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
