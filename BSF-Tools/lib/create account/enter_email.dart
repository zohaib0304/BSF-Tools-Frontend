import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/create%20account/verification_screen.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isValidEmail = false;
  bool isButtonClicked = false;
  String buttonText = "Next";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  void _validateEmail() {
    setState(() {
      isValidEmail = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
      ) // Email validation regex
      .hasMatch(_emailController.text);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: AppColors.white, size: 28),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Enter your email address",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center text inside the widget
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textfieldcolor,
                hintText: "Email address",
                hintStyle: const TextStyle(color: AppColors.textGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: AppColors.white),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            CustomButton(
              isActive: isValidEmail,
              isClicked: isButtonClicked,
              label: buttonText,
              onPressed: () {
                setState(() {
                  buttonText = "Next"; // 🔥 Change it dynamically
                });

                // Simulate async behavior
                Future.delayed(const Duration(seconds: 1), () {
                  _emailController.text.trim();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(),
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
