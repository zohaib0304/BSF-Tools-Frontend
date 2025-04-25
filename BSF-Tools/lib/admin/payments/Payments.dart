import 'package:bsf/App%20Colors/colors.dart';
import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> paymentData = {
    "Today": [
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
    ],
    "April 02": [
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
    ],
    "April 01": [
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
    ],
    "March 25": [
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
      {"account": "001776530012", "time": "17:05", "amount": "\$1,200"},
    ],
  };

  //const
  PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
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
                        'Payments',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24), // Balancing space
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Year
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        '2025',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Transactions by Date
                    ...paymentData.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                color: AppColors.lightwhite,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ...entry.value.map((txn) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.textfieldcolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        txn['account']!,
                                        style: TextStyle(
                                          color: AppColors.white,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        txn['time']!,
                                        style: TextStyle(
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    txn['amount']!,
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      );
                    }),
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
