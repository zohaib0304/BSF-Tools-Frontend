import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/Profile/ProfileScreen.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class EditNameScreen extends StatefulWidget {
  const EditNameScreen({super.key});

  @override
  State<EditNameScreen> createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool isButtonActive = false;
  bool isButtonClicked = false;
  String buttonText = "Save";

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        isButtonActive = _nameController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // App bar custom
            SizedBox(
              height: 56,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Edit name",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Name TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _nameController,
                style: const TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  hintText: 'Enter new name',
                  hintStyle: const TextStyle(color: AppColors.textGrey),
                  filled: true,
                  fillColor: AppColors.textfieldcolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),

            const Spacer(),

            // Save Button at Bottom
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom:
                    mediaQuery.viewInsets.bottom > 0
                        ? 16
                        : 32, // Adjust if keyboard is open
              ),
              child: CustomButton(
                isActive: isButtonActive,
                isClicked: isButtonClicked,
                label: buttonText,
                onPressed: () {
                  setState(() {
                    buttonText = "Save"; // 🔥 Change it dynamically
                  });

                  // Simulate async behavior
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                    setState(() {
                      buttonText = "Save"; // Reset label if needed
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
