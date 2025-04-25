import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/create%20account/enter_name.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isButtonActive = false;
  bool isButtonClicked = false;
  String buttonText = "Done";

  void _validatePasswords() {
    setState(() {
      isButtonActive =
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePasswords);
    _confirmPasswordController.addListener(_validatePasswords);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                "Create password",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textfieldcolor,
                hintText: "Password",
                hintStyle: const TextStyle(color: AppColors.textGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: AppColors.white),
            ),
            const SizedBox(height: 10),
            // Confirm Password TextField
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textfieldcolor,
                hintText: "Confirm password",
                hintStyle: const TextStyle(color: AppColors.textGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            // Done Button
            CustomButton(
              isActive: isButtonActive,
              isClicked: isButtonClicked,
              label: buttonText,
              onPressed: () {
                setState(() {
                  buttonText = "Done"; // 🔥 Change it dynamically
                });

                // Simulate async behavior
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EnterNameScreen()),
                  );
                  setState(() {
                    buttonText = "Done"; // Reset label if needed
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
