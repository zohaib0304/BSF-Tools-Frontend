import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/create%20account/contact_number.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  _EnterNameScreenState createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool isButtonActive = false;
  bool isButtonClicked = false;
  String buttonText = "Next";

  void _validateFields() {
    setState(() {
      isButtonActive =
          _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateFields);
    _lastNameController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  /*void _handleNext() {
    setState(() {
      isButtonClicked = true;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: AppColors.white, size: 28),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Enter your name",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // First Name TextField
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textfieldcolor,
                hintText: "First name",
                hintStyle: const TextStyle(color: AppColors.textGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: AppColors.white),
            ),
            const SizedBox(height: 10),
            // Last Name TextField
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textfieldcolor,
                hintText: "Last name",
                hintStyle: const TextStyle(color: AppColors.textGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            // Next Button
            CustomButton(
              isActive: isButtonActive,
              isClicked: isButtonClicked,
              label: buttonText,
              onPressed: () {
                setState(() {
                  buttonText = "Next"; // 🔥 Change it dynamically
                });

                // Simulate async behavior
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnterContactScreen(),
                    ),
                  );
                  setState(() {
                    buttonText = "Next"; // Reset label if needed
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
