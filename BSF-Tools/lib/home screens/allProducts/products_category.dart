import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/allProducts/products_list.dart';
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
      home: ProductsScreen(),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Electricity", "image": "assets/icons/category 1.png"},
    {"name": "Garage equipment", "image": "assets/icons/category 2.png"},
    {"name": "Electricity", "image": "assets/icons/category 1.png"},
    {"name": "Garage equipment", "image": "assets/icons/category 2.png"},
    {"name": "Electricity", "image": "assets/icons/category 1.png"},
    {"name": "Garage equipment", "image": "assets/icons/category 2.png"},
  ];

  //const
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white, // 🔥 White Text
          ),
        ),
        centerTitle: true,
        /*leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ), // 🔥 White Menu Icon
          onPressed: () {
            // Handle menu click
          },
        ),*/
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.white,
            ), // 🔥 White Search Icon
            onPressed: () {
              // Handle search click
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // 🔥 Enable smooth scrolling
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // 🔥 Disable GridView scrolling
                shrinkWrap: true, // 🔥 Allow GridView to fit within Column
                padding: const EdgeInsets.only(top: 10),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ProductListScreen(
                                categoryName: categories[index]["name"]!,
                              ),
                        ),
                      );
                      // Handle category click
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                categories[index]["image"]!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index]["name"]!,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
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
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.redcolor,
        unselectedItemColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // Highlight "Products" tab
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductsScreen()),
          );
          //Handle bottom navigation click
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
