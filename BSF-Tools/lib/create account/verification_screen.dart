import 'package:bsf/App%20Colors/colors.dart';
import 'package:bsf/create%20account/create_password.dart';
import 'package:bsf/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpController = TextEditingController();
  bool isOtpFilled = false;
  bool isButtonClicked = false;
  String buttonText = "Next";

  void _checkOtpFilled(String value) {
    setState(() {
      isOtpFilled = value.length == 6; // Check if 6-digit OTP is entered
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center, // Center content
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
                "Enter verification code",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // OTP Input Field
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: otpController,
              onChanged: _checkOtpFilled,
              textStyle: TextStyle(color: AppColors.white),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: AppColors.textfieldcolor,
                inactiveFillColor: AppColors.textfieldcolor,
                selectedFillColor: AppColors.textfieldcolor,
                activeColor: AppColors.lightwhite,
                inactiveColor: AppColors.textfieldcolor,
                selectedColor: AppColors.white,
              ),
              keyboardType: TextInputType.number,
              cursorColor: AppColors.white,
            ),

            const SizedBox(height: 20),

            // Next Button
            CustomButton(
              isActive: isOtpFilled,
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
                      builder: (context) => CreatePasswordScreen(),
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
