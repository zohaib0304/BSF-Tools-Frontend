import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/allProducts/product_details1.dart';
import 'package:bsf/home%20screens/allProducts/products_category.dart';
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
      home: ProductListScreen(categoryName: "Electricity"),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  ProductListScreen({super.key, required this.categoryName});

  final List<Map<String, dynamic>> products = [
    {
      "name": "Glass defrosting spray...",
      "image": "assets/icons/product.png",
      "oldPrice": "350.00 RSD",
      "newPrice": "230.00 RSD",
    },
    {
      "name": "Glass defrosting spray...",
      "image": "assets/icons/product.png",
      "oldPrice": "350.00 RSD",
      "newPrice": "230.00 RSD",
    },
    {
      "name": "Glass defrosting spray...",
      "image": "assets/icons/product.png",
      "oldPrice": "350.00 RSD",
      "newPrice": "230.00 RSD",
    },
    {
      "name": "Glass defrosting spray...",
      "image": "assets/icons/product.png",
      "oldPrice": "350.00 RSD",
      "newPrice": "230.00 RSD",
    },
    {
      "name": "Glass defrosting spray...",
      "image": "assets/icons/product.png",
      "oldPrice": "350.00 RSD",
      "newPrice": "230.00 RSD",
    },
    {
      "name": "Glass defrosting spray...",
      "image": "assets/icons/product.png",
      "oldPrice": "350.00 RSD",
      "newPrice": "230.00 RSD",
    },
  ];

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
            // Handle back click
          },
        ),
        title: Text(
          categoryName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.white),
            onPressed: () {
              // Handle search click
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen1(),
                        ),
                      );
                      // Handle product click
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.asset(
                                products[index]["image"]!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            child: Text(
                              products[index]["name"]!,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Text(
                                  products[index]["oldPrice"]!,
                                  style: const TextStyle(
                                    color: AppColors.lightwhite,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  products[index]["newPrice"]!,
                                  style: const TextStyle(
                                    color: AppColors.lessred,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.redcolor,
        unselectedItemColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductsScreen()),
          );
          // Handle bottom navigation click
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
}
