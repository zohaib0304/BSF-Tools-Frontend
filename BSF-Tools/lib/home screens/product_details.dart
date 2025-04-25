import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/add%20to%20cart/cart_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: ProductDetailScreen()),
  );
}

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1; // Default quantity

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            //print("Back button clicked!");
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.white),
            onPressed: () {
              //print("Search button clicked!");
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/icons/product.png", // Load image from assets
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 16),

            // Product Title
            Text(
              "Glass defrosting spray 450 ml",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 8),

            // Product Price
            Text(
              "230.00 RSD",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.lessred,
              ),
            ),
            SizedBox(height: 12),

            // Product Description
            Text(
              "Available for online ordering only.\n"
              "Free delivery for orders over 6000 RSD.\n"
              "The promotion lasts from 22.02.2025 to 02.04.2025.",
              style: GoogleFonts.poppins(fontSize: 14, color: AppColors.white),
            ),
            SizedBox(height: 20),

            // Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.white,
                    size: 28,
                  ),
                  onPressed: _decreaseQuantity,
                ),
                SizedBox(width: 10),
                Text(
                  "$quantity",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: AppColors.white,
                    size: 28,
                  ),
                  onPressed: _increaseQuantity,
                ),
              ],
            ),
            SizedBox(height: 24),

            // Add to Cart Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redcolor,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                  //print("Added $quantity item(s) to cart!");
                },
                child: Text(
                  "Add to cart",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,
        selectedItemColor: AppColors.redcolor,
        unselectedItemColor: AppColors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // Offers tab selected by default
        onTap: (index) {
          //print("Bottom navigation item $index clicked!");
        },
        items: [
          //_bottomNavItem(Icons.settings, "Settings"),
          _bottomNavItem(Icons.percent, "Offers"),
          _bottomNavItem(Icons.grid_view, "Products"),
          _bottomNavItem(Icons.person, "Profile"),
        ],
      ),
    );
  }

  // Bottom Navigation Item
  BottomNavigationBarItem _bottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
