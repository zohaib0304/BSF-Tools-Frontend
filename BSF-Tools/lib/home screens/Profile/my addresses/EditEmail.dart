import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/Profile/my%20addresses/VerifyNewEmail.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({super.key});

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isValidEmail = false;
  bool isButtonClicked = false;
  String buttonText = "Save";

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
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
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
                      "Edit email",
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

            // Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  hintText: 'Enter new email',
                  hintStyle: const TextStyle(color: AppColors.textGrey),
                  filled: true,
                  fillColor: AppColors.textfieldcolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            const Spacer(),

            // Save Button
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: mediaQuery.viewInsets.bottom > 0 ? 16 : 32,
              ),
              child: CustomButton(
                isActive: isValidEmail,
                isClicked: isButtonClicked,
                label: buttonText,
                onPressed: () {
                  setState(() {
                    buttonText = "Save"; // 🔥 Change it dynamically
                  });

                  // Simulate async behavior
                  Future.delayed(const Duration(seconds: 1), () {
                    _emailController.text.trim();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyEmailScreen(),
                      ),
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
//_emailController.text.trim();