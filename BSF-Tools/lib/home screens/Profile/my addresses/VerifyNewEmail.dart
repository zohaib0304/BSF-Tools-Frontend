import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/home%20screens/Profile/ProfileScreen.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String otpCode = "";
  //bool isButtonActive = false;
  bool isButtonClicked = false;
  String buttonText = "Save";

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
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
                  const Text(
                    "Verify new email",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // OTP Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 45,
                  activeFillColor: AppColors.textfieldcolor,
                  inactiveFillColor: AppColors.textfieldcolor,
                  selectedFillColor: AppColors.textfieldcolor,
                  activeColor: AppColors.lightwhite,
                  inactiveColor: AppColors.textfieldcolor,
                  selectedColor: AppColors.white,
                ),
                backgroundColor: AppColors.background,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) {
                  setState(() {
                    otpCode = value;
                  });
                },
                textStyle: const TextStyle(color: AppColors.white),
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
                isActive: otpCode.length == 6,
                isClicked: isButtonClicked,
                label: buttonText,
                onPressed: () {
                  setState(() {
                    buttonText = "Save"; // 🔥 Change it dynamically
                  });

                  // Simulate async behavior
                  Future.delayed(const Duration(seconds: 1), () {
                    //_emailController.text.trim();
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
