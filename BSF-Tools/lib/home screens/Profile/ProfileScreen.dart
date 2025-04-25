import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/Profile/my%20addresses/ChangePassword.dart';
import 'package:bsf/home%20screens/Profile/my%20addresses/EditEmail.dart';
import 'package:bsf/home%20screens/Profile/my%20addresses/EditName.dart';
import 'package:bsf/home%20screens/Profile/my%20addresses/MyAdressesScreen.dart';
import 'package:bsf/home%20screens/Profile/my%20orders/MyOrdersScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool pushNotifications = true;
  bool emailOffers = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          /*Positioned.fill(
            child: Image.asset(
              'assets/icons/loginbackground.png',
              fit: BoxFit.cover,
            ),
          ),*/
          // Top Section with Gradient Background
          Container(
            padding: const EdgeInsets.only(
              top: 80,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.redcolor, // Dark Red
                  AppColors.background,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello, Alex Smith",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildOptionButton(Icons.list_alt, "My orders", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyOrdersScreen(),
                        ),
                      );
                    }),
                    _buildOptionButton(Icons.location_on, "My addresses", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyAddressesScreen(),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),

          // General Settings
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: const BoxDecoration(
                  color:
                      AppColors
                          .background, // Background color inside the container
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), // Rounded top-left corner
                    topRight: Radius.circular(20), // Rounded top-right corner
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("General"),
                    _buildLanguageOption("Languages", "English"),
                    const Divider(
                      color: AppColors.dividergrey,
                      thickness: 0.4,
                      height: 1,
                    ),

                    _buildToggleOption(
                      "Receive push notifications",
                      pushNotifications,
                      (val) {
                        setState(() => pushNotifications = val);
                      },
                    ),
                    const Divider(
                      color: AppColors.dividergrey,
                      thickness: 0.4,
                      height: 1,
                    ),

                    _buildToggleOption("Receive offers by email", emailOffers, (
                      val,
                    ) {
                      setState(() => emailOffers = val);
                    }),
                    const Divider(
                      color: AppColors.dividergrey,
                      thickness: 0.4,
                      height: 1,
                    ),

                    const SizedBox(height: 5),

                    _sectionTitle("Account Settings"),

                    //_sectionTitle("Account Settings"),
                    _buildEditableField("Name", "Alex Smith", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditNameScreen(),
                        ),
                      );
                    }),
                    const Divider(
                      color: AppColors.dividergrey,
                      thickness: 0.4,
                      height: 1,
                    ),

                    _buildEditableField("Email", "Alexsmith@gmail.com", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditEmailScreen(),
                        ),
                      );
                    }),
                    const Divider(
                      color: AppColors.dividergrey,
                      thickness: 0.4,
                      height: 1,
                    ),

                    _buildEditableField("Password", "**********", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.redcolor,
        unselectedItemColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2, // Highlight "Products" tab
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
          //Handle bottom navigation click
        },
        items: const [
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

  // Custom Widget for Profile Buttons (My Orders, My Addresses)
  // Custom Widget for Profile Buttons (My Orders, My Addresses)
  Widget _buildOptionButton(
    IconData icon,
    String text,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed, // Trigger the navigation function
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(icon, size: 18),
      label: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }

  // Custom Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Custom Language Selection Row
  Widget _buildLanguageOption(String title, String value) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: AppColors.white)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(color: AppColors.lessred, fontSize: 16),
          ),
          //const SizedBox(width: 10),
          //const Icon(Icons.edit, color: Colors.white70, size: 18),
        ],
      ),
    );
  }

  // Custom Toggle Switch Row
  Widget _buildToggleOption(
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: AppColors.white)),
      value: value,
      activeColor: AppColors.redcolor,
      onChanged: onChanged,
    );
  }

  // Custom Editable Text Field with Edit Icon
  Widget _buildEditableField(String title, String value, VoidCallback onTap) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: AppColors.textGrey)),
      subtitle: Text(
        value,
        style: const TextStyle(color: AppColors.white, fontSize: 16),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: const Icon(Icons.edit, color: AppColors.white, size: 18),
      ),
    );
  }
}
