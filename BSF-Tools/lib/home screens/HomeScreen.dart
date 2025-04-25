import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/admin/AdminDashboard.dart';
import 'package:bsf/home%20screens/Profile/ProfileScreen.dart';
import 'package:bsf/home%20screens/allProducts/products_category.dart';
import 'package:bsf/home%20screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Default selected tab is "Offers"

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation logic here (Navigate to different screens)
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        //print("Already in Offers Screen");
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductsScreen()),
        );
        //print("Navigating to Products...");
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        //print("Navigating to Profile...");
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminDashboardScreen()),
        );
        //print("Navigating to admin...");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: null,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/icons/loginbackground.png',
              fit: BoxFit.cover,
            ),
          ),

          // Search Icon Positioned Top Left
          Positioned(
            top: 40, // Adjust as needed (depends on status bar)
            right: 16,
            child: IconButton(
              icon: Icon(Icons.search, color: AppColors.white),
              onPressed: () {
                // Handle search
              },
            ),
          ),

          // Foreground Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100), // Push content below search icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: AppColors.white,
                      ),
                      children: const [
                        TextSpan(text: "👋 Hey there,\n"),
                        TextSpan(
                          text: "Welcome to ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "BSF Tools!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.redcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                _buildSectionTitle("Offer of the week"),
                _buildProductSlider(),
                const SizedBox(height: 25),
                _buildSectionTitle("Products on sale"),
                _buildProductSlider(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,
        selectedItemColor: AppColors.redcolor,
        unselectedItemColor: AppColors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap, // Handle bottom navigation taps
        items: [
          //_bottomNavItem(Icons.settings, "Settings"),
          _bottomNavItem(Icons.percent, "Offers"),
          _bottomNavItem(Icons.grid_view, "Products"),
          _bottomNavItem(Icons.person, "Profile"),
          _bottomNavItem(Icons.admin_panel_settings, "Admin"),
        ],
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Product Slider
  Widget _buildProductSlider() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen()),
              );
              //print("Product $index clicked!");
            },
            child: _buildProductCard(),
          );
        },
      ),
    );
  }

  // Product Card
  Widget _buildProductCard() {
    return Container(
      width: 160,
      height: 350,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/icons/product.png", // Replace with actual image
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  "Glass defrosting spray",
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  "350.00 RSD",
                  style: TextStyle(
                    color: AppColors.lightwhite,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  "230.00 RSD",
                  style: TextStyle(
                    color: AppColors.lessred,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Item
  BottomNavigationBarItem _bottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
